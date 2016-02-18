require 'sinatra'
require 'sinatra/reloader'
require 'pony'

get '/' do
  erb :indexeng
end

get '/indexru' do
  erb :indexru
end


post '/thankseng' do
  Pony.mail({
    :from => 'info@doctravel.com',
    :to => params[:email],
    :bcc => 'info@doctravel.com',
    :bcc => 'rolenchyn@doctravel.com',
    :subject => "Doctravel - ключ ко всей зарубежной медицине",
    :body => "Спасибо за ваш интерес к нашему проекту! Вы можете скачать презентацию проекта по этому линку: https://s3.amazonaws.com/uploads.hipchat.com/471390/3011413/D0OIllENbV6SOcj/DocTravel%20ustartup.pdf Хорошего дня!",
    :via => :smtp,
    :via_options => {
      address: "smtp.mandrillapp.com",
      port: 587,
      domain: "doctravel.com",
      authentication: "plain",
      user_name: "info@doctravel.com",
      password: ""
    }
  })
  redirect '/thankseng'
end

post '/thanksru' do
  Pony.mail({
    :from => 'info@doctravel.com',
    :to => params[:email],
    :bcc => 'info@doctravel.com',
    :bcc => 'rolenchyn@doctravel.com',
    :subject => "DocTravel - your personal access key to all foreign medicine",
    :body => "Thank you for your interest to our project! You can download the presentation of our project by this link: https://s3.amazonaws.com/uploads.hipchat.com/471390/3011413/D0OIllENbV6SOcj/DocTravel%20ustartup.pdf Have a good day!",
    :via => :smtp,
    :via_options => {
      address: "smtp.mandrillapp.com",
      port: 587,
      domain: "doctravel.com",
      authentication: "plain",
      user_name: "info@doctravel.com",
      password: ""
    }
  })
  redirect '/thanksru'
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
