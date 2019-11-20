require 'socket'

server = TCPServer.new(9999)

SERVER_ROOT = '/home/user1/web/RubyWebServer'


while (session = server.accept)
  request = session.gets # text string: 'GET /'
  puts request

  method, full_path = request.split(' ')
  file_path =
      if full_path == '/'
        "#{SERVER_ROOT}/index.html"
      else
        "#{SERVER_ROOT}#{full_path}"
      end

  body = if File.file?(file_path)
           File.read(file_path)
         else
           '404'
         end

  status = if File.file?(file_path)
             '200'
           else
             '404'
           end

  response = "HTTP/1.1 #{status}\r\n"
  response << "Content-Type: text/html\r\n"
  response << "\r\n"

  # response << "<!DOCTYPE html> <html lang = 'en'>
 #   <head>
 #     <title>Hello!</title>
 #   </head>
 #
 #   <body>
 #     <h1>Hello World!</h1>
 #   </body>
 # </html>
 # "

  response << body

  session.print response
  session.close
end
