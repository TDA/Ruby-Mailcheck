require 'net/smtp'
class Mailcheck
  puts "Please enter the to: email"
inp = gets.chomp
message = """
From: Private Person <me@fromdomain.com>
To: """ + inp + """
Subject: SMTP e-mail test

This is a test e-mail message.
"""

  print message
  Net::SMTP.start('localhost', 1025) do |smtp|
    smtp.send_message message, 'me@fromdomain.com',
                      'test@todomain.com'
  end
end