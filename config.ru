require 'rubygems'
require 'sinatra'
require File.expand_path '../app.rb', __FILE__

enable :logging
#set :server, 'Thin'  
set :environment, :production
set :bind, '178.62.227.195'
#set :port, 4567

run app.rb
