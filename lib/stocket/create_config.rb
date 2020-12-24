#!/usr/bin/ruby

IEX_CLOUD_KEY = ENV['IEX_CLOUD_KEY']
ONESIGNAL_APPID = ENV['ONESIGNAL_APPID']
IAPHUB_API_KEY = ENV['IAPHUB_API_KEY']
IAPHUB_APPID = ENV['IAPHUB_APPID']
IEX_URL = ENV['IEX_URL']
IAPHUB_ENV = ENV['IAPHUB_ENV']
APPSTORE_APP_SECRET = ENV['STOCKET_APPSTORE_APP_SECRET']
IEX_CLOUD_SSE_URL=ENV['IEX_CLOUD_SSE_URL']
GOOGLE_STOCKET_WEB_CLIENT_ID=ENV['GOOGLE_STOCKET_WEB_CLIENT_ID']
STOCKET_API_URL=ENV['STOCKET_API_URL']

open("./config.js", 'w') { |output_file|
  puts __dir__
  output_file.puts "export const IEX_CLOUD_KEY = '#{IEX_CLOUD_KEY}'"
  puts "created IEX_CLOUD_KEY"
  output_file.puts "export const IAPHUB_API_KEY = '#{IAPHUB_API_KEY}'"
  puts "created IAPHUB_API_KEY"
  output_file.puts "export const IAPHUB_APPID = '#{IAPHUB_APPID}'"
  puts "created IAPHUB_APPID"
  output_file.puts "export const IEX_URL = '#{IEX_URL}'"
  puts "created IEX_URL"
  output_file.puts "export const IAPHUB_ENV = '#{IAPHUB_ENV}'"
  puts "created IAPHUB_ENV"
  output_file.puts "export const APPSTORE_APP_SECRET = '#{APPSTORE_APP_SECRET}'"
  puts "created APPSTORE_APP_SECRET"
  output_file.puts "export const IEX_CLOUD_SSE_URL = '#{IEX_CLOUD_SSE_URL}'"
  puts "created IEX_CLOUD_SSE_URL"
  output_file.puts "export const GOOGLE_STOCKET_WEB_CLIENT_ID = '#{GOOGLE_STOCKET_WEB_CLIENT_ID}'"
  puts "created GOOGLE_STOCKET_WEB_CLIENT_ID"
  output_file.puts "export const STOCKET_API_URL = '#{STOCKET_API_URL}'"
  puts "created STOCKET_API_URL"
}
