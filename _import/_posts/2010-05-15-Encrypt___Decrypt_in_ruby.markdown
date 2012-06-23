---
layout: post
title: Encrypt___Decrypt_in_ruby
date: '2010-5-15'
comments: true
categories: Ruby&Rails
link: true
---
{% codeblock %}require 'openssl'
require 'digest/sha1'
c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
c.encrypt
# your pass is what is used to encrypt/decrypt
c.key = key = Digest::SHA1.hexdigest("yourpass")
c.iv = iv = c.random_iv
e = c.update("crypt this")
e &lt;&lt; c.final
puts "encrypted: #{e}\n"
c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
c.decrypt
c.key = key
c.iv = iv
d = c.update(e)
d &lt;&lt; c.final
puts "decrypted: #{d}\n"{% endcodeblock %}
{% codeblock %}{% endcodeblock %}
{% codeblock %}
{% codeblock %}require 'openssl'

keyfile = 'test.key'
certfile = 'test.crt'
data = "this is a test"

cert = OpenSSL::X509::Certificate.new(File.read(certfile))
key = OpenSSL::PKey::RSA.new(File.read(keyfile))
cipher = OpenSSL::Cipher::AES.new("128-CBC")

tmp = OpenSSL::PKCS7.encrypt([cert], data, cipher,
OpenSSL::PKCS7::BINARY)
p7 = OpenSSL::PKCS7::PKCS7.new(tmp.to_der)

## Data will be stored as string so emulate that here
p7s = p7.to_s

## Create pkcs7 object out of pkcs7 data
p7 = OpenSSL::PKCS7::PKCS7.new(p7s)
dec = p7.decrypt(key,cert)
print dec{% endcodeblock %}
{% endcodeblock %}
http://nunojob.wordpress.com/2008/12/08/rsa-encrypt-decrypt-in-ruby/

http://www.ruby-forum.com/topic/79319
