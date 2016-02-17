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
      :cc => 'siansor@gmail.com',
      :subject => "Contact Message",
      :body => "Contact link <a href='http://doctravel.com/DocTravelRU.pdf'> Link </a> ",
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
