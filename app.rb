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
      :from => 'shapalov@gmail.com',
      :to => 'shapalov@gmail.com',
      :subject => "Contact Message",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'sasha@gmail.com',
        :password             => '111111',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })
    redirect '/stream'

end


class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get '/stream' do
  erb :stream
  Stream.new
end
