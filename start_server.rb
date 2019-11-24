require_relative 'lib/server'
require 'nokogiri'
require 'sinatra'

#get '/main' do
#  doc = Nokogiri::HTML(File.open("#{__dir__}/app/index.html"))
#  doc.xpath("//*[@id='time']")[0].inner_html = "#{Time.now}"
#  doc.to_s
#end

Server.new(
  port: 144,
  host: 'localhost',
  web_root: "#{__dir__}/app"
).start