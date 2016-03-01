require 'sinatra'
require 'net/smtp'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  return 'Hello world'
end

get '/hello' do
  erb :hello
end

post '/hello' do
  greeting = params[:greeting] || "Hi There"
  email = params[:email] || "Nobody"

  message = """
From: Private Person <me@fromdomain.com>
To: #{email}
Subject: SMTP e-mail test

This is a test e-mail message.
"""

  print message
  Net::SMTP.start('localhost', 1025) do |smtp|
    smtp.send_message message, 'me@fromdomain.com',
                      'test@todomain.com'
  end

  erb :index, :locals => {'greeting' => message, 'email' => email}
end