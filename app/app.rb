require 'sinatra/base'

class HealthBoardApp < Sinatra::Base
  
  get "/" do
    "hello"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end