require 'rest-client'
require 'twilio-ruby'
require 'pry'

from = '+12036934059'

account_sid = 'ACbcd5bdb8dce3a5d59e49d938fd5f279c'
auth_token = '6157f4eaed6b2a112f392a567505096c'
client = Twilio::REST::Client.new account_sid, auth_token


daily_video = {
    'sunday' => 'https://www.youtube.com/watch?v=btPJPFnesV4',
    'monday' => 'https://www.youtube.com/watch?v=SsmVgoXDq2w',
    'tuesday' => 'https://www.youtube.com/watch?v=avFq9errZCk',
    'wednesday' => 'https://www.youtube.com/watch?v=6Fa7dI2TyDc',
    'thursday' => 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    'friday' => 'https://www.youtube.com/watch?v=y6y_4_b6RS8',
    'saturday' => 'https://www.youtube.com/watch?v=y6y_4_b6RS8'
}


puts "Hello! What dayz it?"
  day_input = gets.chomp.downcase
  daily_video= daily_video[day_input]

puts "What is your phone number?"
phone_number_input = gets.strip


while daily_video.nil?
    puts "Sorry, #{day_input} is an invalid date. Please try again or
    hit CONTROL + C to exit."
    daily_video = gets.chop.downcase
    daily_video = daily_video[day_input]
end

body = "Enjoy your daily video ya silly goose! #{daily_video}"
      client.account.messages.create({ from: from, to: phone_number_input, body: body
        })

puts "Check Your Phone- and have a great #{day_input}"
