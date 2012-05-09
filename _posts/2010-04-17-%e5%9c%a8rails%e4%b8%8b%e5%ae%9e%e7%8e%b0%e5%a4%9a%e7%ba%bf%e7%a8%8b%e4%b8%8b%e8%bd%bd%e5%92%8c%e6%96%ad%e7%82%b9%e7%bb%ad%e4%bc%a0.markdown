--- 
layout: post
comments: true
title: !binary |
  5ZyocmFpbHPkuIvlrp7njrDlpJrnur/nqIvkuIvovb3lkozmlq3ngrnnu63k
  vKA=

date: 2010-4-17
link: false
categories: life
---
最近一个项目用到了断点续传的需求，找了一些资料，
ror下文件下载是通过send_file完成的，但是如果使用多线程并支持断点续传的客户端（FlashGet等），send_file是不能正确工作的，原因在于，send_file函数没有对HTTP协议的Range头做相应的支持，并且也不支持HTTP/1.1 206 Partial Content相应
我修改了send_file函数，并做了一个plugin 将起解压到vendor/plugins/就可以了
（必要的地方我都写了注释，欢迎大家提出建议和意见）
记录一下相关的code：
 <pre class="brush:ruby">
module ActionController
  module Streaming
    protected
      def send_file(path, options = {})
        raise MissingFile, "Cannot read file #{path}" unless File.file?(path) and File.readable?(path)

        options[:length]   ||= File.size(path) # 文件长度
        options[:filename] ||= File.basename(path) # 文件名称

        options[:from] ||= 0 # 首偏移量（从哪里开始下载）
        options[:to] ||= options[:length] # 结束位置

        m_send_file_headers! options # 设置必要的 http 头

        @performed_render = false

        if options[:stream]
          render :status => options[:status], :text => Proc.new { |response, output|
            logger.info "Streaming file #{path}" unless logger.nil?
            len = options[:buffer_size] || 8192 # 原来的实现是4K， 不过APUE 上说，8K 要好一些，所有我调整了一下
            File.open(path, 'rb') do |file|
              file.seek(options[:from].to_i, IO::SEEK_SET) if options[:status] == 206 # 如果是多线程下载，则将流定位到首偏移量位置，从此处开始传输
              while buf = file.read(len)
                output.write(buf)
              end
            end
          }
        else
          logger.info "Sending file #{path}" unless logger.nil?
          File.open(path, 'rb') { |file| render :status => options[:status], :text => file.read }
        end
      end

    private
      def m_send_file_headers!(options)
        options.update(DEFAULT_SEND_FILE_OPTIONS.merge(options))
        [:length, :type, :disposition].each do |arg|
          raise ArgumentError, ":#{arg} option required" if options[arg].nil?
        end

        disposition = options[:disposition].dup || 'attachment'

        disposition <<= %(; filename="#{options[:filename]}") if options[:filename]

	# 先输出一些通用的HTTP头
        headers.update(
          'Content-Type'              => options[:type].strip,  # fixes a problem with extra '\r' with some browsers
          'Content-Disposition'       => disposition,
          'Content-Transfer-Encoding' => 'binary'
        )

	# 判断是否存在Range头，并使用正则表达式匹配 from 和 to
	# 如果匹配成功，则表示客户端使用多线程下载，同时一定要将http status 设置为 206
        if request.env['HTTP_RANGE'] =~ /bytes=(\d+)-(\d*)/ then # 注意后一个\d*，有一些多线程客户端并不完全符合http协议的要求（例如FlashGet）
          options[:from] = $1
          options[:to] = $2 unless $2.nil? # 如果客户端不标准，就将 to 设置为文件末尾

	  # 匹配成功，设置status 为 206
          options[:status] = 206

	  # 一下3个http 头仅在多线程下载是有用
          headers['Accept-Ranges'] = 'bytes'
          headers['content-Range'] = "bytes #{options[:from]}-#{options[:to]}/#{options[:length]}" # 格式为 bytes from-to/total
          headers['Content-Length'] = options[:to].to_i - options[:from].to_i + 1 # 注意 在多线程下载下，Content-Length 为传输的实际字节数（从0开始算起，所有要+1）
        else
	  # 非多现场下载
          options[:status] = 200 # 请求正常标志
          headers['Content-Length'] = options[:length] # 非多线程下载下，Content-Length为文件长度
        end

        headers['Cache-Control'] = 'private' if headers['Cache-Control'] == 'no-cache'
      end
  end
end
{% endcodeblock %}

用法：
 <pre class="brush:ruby">
class FileController 〈 ApplicationController
def download
#logger.debug request.env['Range'];
#    request.env.each do |key, value|
#      logger.debug key + '--------' + value
#    end
send_file 'public/jdk.tgz'
end
end
{% endcodeblock %}
