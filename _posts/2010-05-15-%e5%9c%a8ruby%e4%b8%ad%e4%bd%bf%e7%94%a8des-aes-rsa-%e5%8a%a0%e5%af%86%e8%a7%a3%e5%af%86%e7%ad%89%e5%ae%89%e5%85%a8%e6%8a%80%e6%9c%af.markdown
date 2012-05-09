--- 
layout: post
comments: true
title: !binary |
  5ZyocnVieeS4reS9v+eUqGRlcyBhZXMgcnNhIOWKoOWvhuino+WvhuetieWu
  ieWFqOaKgOacrw==

date: 2010-5-15
link: false
categories: life
---
终结下来三大类

1,md5 sha1等消息摘要

用的很多，比较熟悉，只是用于验证消息的完整性，而消息本省的传递确是明码的，除非想登录密码md5，那要服务器客户端两边都有。如果需要传输数据给另一方，而这段数据又不希望明文发就得使用密钥了。

2，des等 ，私有密钥加密数据

只要约定密钥，然后在通过这个密钥对信息加密然后传送，另一方通过密钥对加密信息解密。

3，rsa ， 公钥和密钥结合的高级货

公钥不是大家都使用的，而是可以公开的，我开始误会错了搞不懂。通过rsa生成一对密钥，公钥和私钥，通过公钥加密的数据，只有私钥才能解开。那在网络中可以随便告诉客户端公钥，然后对方通过公钥加密后传加密信息，即使地球人都知道公钥也不要紧，因为私钥是保密的，解不开得到了加密信息也没办法。当然私钥加密后信息，公钥也可以解开，但速度上差成百上千倍。

ruby中通过openssl这个自带的标准库来实现。举了几个例子，des和rsa的

#!/usr/bin/ruby

require "openssl"
#doc see http://www.ruby-doc.org/stdlib/libdoc/openssl/rdoc/index.html

class Encrypt
    KEY = "aaaabbbb"
    IV = "aaaavvvv"
    def des_encrypt(plaintext)
        c = OpenSSL::Cipher::Cipher.new("DES-CBC")
        c.encrypt
        c.key = KEY
        c.iv = IV
        ret = c.update(plaintext)
        ret << c.final
    end

    def des_decrypt(encrypt_value)
        c = OpenSSL::Cipher::Cipher.new("DES-CBC")
        c.decrypt
        c.key = KEY
        c.iv = IV
        ret = c.update(encrypt_value)
        ret << c.final
    end

    def get_rsa_key
        rsa = OpenSSL::PKey::RSA.new(1024)
        # public_key only can public_encrypt or public_decrypt no private_encrypt nor private_decrypt
        #rsa.public_key.to_pem the class of return value is String
        [rsa.public_key.to_pem , rsa.to_pem]
    end

    def rsa_private_encrypt(value , rsakey)
        rsa = OpenSSL::PKey::RSA.new(rsakey)
        rsa.private_encrypt(value)
    end

    def rsa_private_decrypt(value , rsakey)
        rsa = OpenSSL::PKey::RSA.new(rsakey)
        rsa.private_decrypt(value)
    end

    def rsa_public_encrypt(value , publickey)
        rsa = OpenSSL::PKey::RSA.new(publickey)
        rsa.public_encrypt(value)
    end

    def rsa_public_decrypt(value , publickey)
       rsa = OpenSSL::PKey::RSA.new(publickey)
       rsa.public_decrypt(value)
    end
end

def testrun
    e = Encrypt.new
    text = "a secret message"
    puts "text:#{text}"
    value = e.des_encrypt(text)
    puts "des_encrypt:#{value}"
    des_decrypt = e.des_decrypt(value)
    puts "des_decrypt:#{des_decrypt}"

    puts "-------------------------"
    publickey , privatekey = e.get_rsa_key
    puts "publickey:\n#{publickey} \n privatekey=\n#{privatekey}"

    value1 = e.rsa_private_encrypt(text , privatekey)
    puts "rsa_private_encrypt:#{value1}"
    rsa_public_decrypt = e.rsa_public_decrypt(value1 , publickey)
    puts "rsa_public_decrypt:#{rsa_public_decrypt}"

    value2 = e.rsa_public_encrypt("another message" , publickey)
    puts "rsa_public_encrypt:#{value2}"
    rsa_private_decrypt =  e.rsa_private_decrypt(value2 , privatekey)
    puts "rsa_private_decrypt:#{rsa_private_decrypt}"

    puts "----------------------------"
    rsa = OpenSSL::PKey::RSA.new(1024 , 7)
    value3 = rsa.private_encrypt("myself key")
    puts rsa.public_decrypt(value3)
end

testrun

测试结果：
IceskYsl@eoe ~/Desktop $ ruby encrypt.rb
text:a secret message
des_encrypt:羻"j}####9"q###A##
des_decrypt:a secret message
-------------------------
publickey:
-----BEGIN RSA PUBLIC KEY-----
MIGJAoGBALrAGpm39jexyrrkYuM6kyP0z+pBlY/i3WnIYHrR3PDk9af2GsuIUwqg
vhKRMxv5EZh1CShec++DfRAaBHwM2zCcHA1rDqrzqoSMdyCav+wbVwkSblqGb6gz
Q4Zk/nM73mF1PaOkZvlpKN7B5H7BsUN2ngpaz4u9MxMm0Tn1guIVAgMBAAE=
-----END RSA PUBLIC KEY-----

 privatekey=
-----BEGIN RSA PRIVATE KEY-----
MIICXQIBAAKBgQC6wBqZt/Y3scq65GLjOpMj9M/qQZWP4t1pyGB60dzw5PWn9hrL
iFMKoL4SkTMb+RGYdQkoXnPvg30QGgR8DNswnBwNaw6q86qEjHcgmr/sG1cJEm5a
hm+oM0OGZP5zO95hdT2jpGb5aSjeweR+wbFDdp4KWs+LvTMTJtE59YLiFQIDAQAB
AoGBAKbgsSR5yfBc1J8LJP6OQhvYUM6xCngILvivEN/PltJAlvAfMDR+Pk558z9e
NsChYcLNmoBTXuBBrEjuJuG/D0GpOmLadoZYDjlciJxj3Y9w85EvfRssdYGsBvIY
ksHVfsYEKJXp41ORux1jZgJXsnxn9276F7Unam65mPyUleiFAkEA8LMpAfgc3y4f
iHiDSon0AcgoIyH4eiiyxGPQEavIVgD2njRCM2pg3Z2uS3c/Et+EAaLjy9N1Cfy6
plZRwHuXqwJBAMafCjgUQaqFisJNSUWWsENVzjmfk2pnGK1TJot3BtpN67rX1dcC
Q3cNWbVhoF6zp6y+Kn/Lrdx1N+eNvhLOrT8CQQCl09jZuXUysVUaMWTKkrZgD+TP
J5VHnAhlUxrDQeU4k1tU7U36nDx2Ei9FYLc8qm8IrY9hGqLUqaBx/qA+CygXAkAu
sAGp7vEEkUFtrNcVWXdzTH8eQmlXcIZ3b302+TKOLBTGJafpU2niWSwGG72jpR07
2LOKuKjUkmUis8nDB/vnAkAxTVKBDYhfInF1/8/bhDAeqrWLifJUmxLEmO9WSRWm
I5ZodXZIaNOBRCSZToQSdfPbhWtQ68sWGNbI0YYwm3OZ
-----END RSA PRIVATE KEY-----
rsa_private_encrypt:#k4#e|########՗#F#####0     ###3
                                                    ##  õë######o#####')
c###########m##7e¼####u $>#######hUKc(#ۯ#####Us0T#######
                                                         rsa_public_decrypt:a secret message
rsa_public_encrypt:t####H
                         "#########'#H7############O#j####H###v#]Q`TR###Hs#U%####L###Z#####rѽ##
                                                                                               ###F##(#X##˵#3####rsa_private_decrypt:another message
----------------------------
myself key
