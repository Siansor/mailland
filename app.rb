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
      :subject => "DocTravel презентация ",
      :body => "Спасибо. Ваш линк для скачивания презентации http://doctravel.com/DocTravelRU.pdf",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'shapalov@gmail.com',
        :password             => '',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
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
