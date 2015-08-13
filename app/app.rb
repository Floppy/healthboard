require 'sinatra/base'

# configure required environment variables
require 'jiffybag'
JiffyBag.configure %w{
  FITBIT_CONSUMER_KEY
  FITBIT_CONSUMER_SECRET
  FITBIT_USER_TOKEN
  FITBIT_USER_SECRET
}

# Load models
$: << File.dirname(__FILE__) + "/models"
require "person"

# configure fitbit connection
require 'fitgem'
$fitbit = Fitgem::Client.new(
  consumer_key: JiffyBag["FITBIT_CONSUMER_KEY"],
  consumer_secret: JiffyBag["FITBIT_CONSUMER_SECRET"],
)
$fitbit.reconnect(JiffyBag["FITBIT_USER_TOKEN"], JiffyBag["FITBIT_USER_SECRET"])

# App
class HealthBoardApp < Sinatra::Base
  
  get "/" do
    @person = Person.instance
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end