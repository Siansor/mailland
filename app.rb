require 'sinatra'
require 'sinatra/reloader'
require 'pony'

get '/' do
  erb :index
end

post '/mail' do
  # @name =  params[:name]
  # @email =  params[:email]

    Pony.mail({
      :from => 'info@doctravel.com',
      :to => params[:email],
      :bcc => 'shapalov@gmail.com',
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
        password: "6SSKZqhx1KBoEAdvHhjSug"
      }
    })
    redirect '/thanks'
end


class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get '/thanks' do
  erb :thanks
end

get '/DocTravelRU.pdf' do
  attachment 'DocTravelRU.pdf'
end
