require 'fileutils'
require 'date'
require 'yaml'
require 'cgi'
require 'rexml/document'
require 'open-uri'
require './youdao_fanyi.rb'
include REXML
require 'hpricot'
# doc = Document.new File.new(ARGV[0])
doc = Hpricot::XML(File.read(ARGV[0]))
 
CN_RE = /[\u4e00-\u9fa5]/m 

FileUtils.mkdir_p "_posts"

 (doc/:channel/:item).each do |item|
# doc.elements.each("rss/channel/item[wp:status = 'publish' and wp:post_type = 'post']") do |e|
    # post = e.elements
    title = item.at(:title).inner_text.strip
    slug = title
    slug = YouDaoFanyi.new().translate(slug)  if  slug =~ CN_RE
    slug = slug.gsub!(/[^0-9A-Za-z.\-]/, '_')
    # slug = post['wp:post_name'].text
    date = DateTime.parse(item.at('wp:post_date').inner_text)
    
    name = "%02d-%02d-%02d-%s.markdown" % [date.year, date.month, date.day, slug]
    date_string = date.year.to_s + "-" + date.month.to_s + '-' + date.day.to_s

    # clean up years of category randomness in one fell swoop. 
    # category_string = post['category'].text
    tags = (item/:category).select{|c| c['domain'] == 'post_tag'}.map{|c| c.inner_text}.reject{|c| c == 'Uncategorized'}.uniq.join(' ')
    category_string = (item/:category).select{|c| c['domain'] == 'category'}.map{|c| c.inner_text}.reject{|c| c == 'Uncategorized'}.uniq.join(' ')
    link_string = true
    
 

    content_text = item.at('content:encoded').inner_text
    
    content = content_text#.encode("UTF-8")

    # convert <code></code> blocks to {% codeblock %}{% encodebloc %}
    #content = content.gsub(/<code>(.*?)<\/code>/, '`\1`')
    content = content.gsub(/<code>/, '{% codeblock %}')
    content = content.gsub(/<\/code>/, '{% endcodeblock %}')

    # convert <pre></pre> blocks to {% codeblock %}{% encodebloc %}
    #content = content.gsub(/<pre lang="([^"]*)">(.*?)<\/pre>/m, '`\1`')
    content = content.gsub(/<pre>/, '{% codeblock %}')
    content = content.gsub(/<pre lang="([^"]*)">/, '{% codeblock %}')
    content = content.gsub(/<\/pre>/m, '{% endcodeblock %}')
    
    
    (1..3).each do |i|
        content = content.gsub(/<h#{i}>([^<]*)<\/h#{i}>/, ('#'*i) + ' \1')
    end

    puts "Converting: #{name}"

    data = {
        'layout' => 'post',
        'title' => title,
        'date' => date_string,
        'comments' => true,
        'categories' => category_string,
        'tags' => tags,
        'link' => link_string
     }.delete_if { |k,v| v.nil? || v == ''}.to_yaml
     

     File.open("_posts/#{name}", "w") do |f|
         f.puts data
         f.puts "---"
         f.puts content
     end
 
end