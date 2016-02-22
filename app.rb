require 'sinatra'
require 'sinatra/reloader'
require 'pony'

# set :port, 80

get '/' do
  erb :indexeng
end

get '/indexru' do
  erb :indexru
end


post '/thanksru' do

  mail = params[:email]

  Pony.mail({
    :from => 'info@doctravel.com',
    :to => params[:email],
    :cc => 'siansor@gmail.com',
    :subject => "Doctravel - ключ ко всей зарубежной медицине",
    :body => "Thank you. The link to the presentation https://goo.gl/375DMN " ,
    :via => :smtp,
    :via_options => {
      address: "smtp.mandrillapp.com",
      port: 587,
      domain: "doctravel.com",
      authentication: "plain",
      user_name: "info@doctravel.com",
      password: "6SSKZqhx1KBoEAdvHhjSug"
    }
  })
  redirect '/thanksru'
end

post '/thankseng' do
  mail = params[:email]

  Pony.mail({
    :from => 'info@doctravel.com',
    :to => params[:email],
    :cc => 'info@doctravel.com',
    :subject => "DocTravel - your personal access key to all foreign medicine",
    :body => "Thank you for your interest to our project! You can download the presentation of our project by this link: https://goo.gl/375DMN Have a good day!  #{mail}",
    :via => :smtp,
    :via_options => {
      address: "smtp.mandrillapp.com",
      port: 587,
      domain: "doctravel.com",
      authentication: "plain",
      user_name: "info@doctravel.com",
      password: "6SSKZqhx1KBoEAdvHhjSug"
    }
  })
  redirect '/thankseng'
end

class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get '/thankseng' do
  erb :thankseng
end

get '/thanksru' do
  erb :thanksru
end


get '/DocTravelRU.pdf' do
  attachment 'DocTravelRU.pdf'
end
