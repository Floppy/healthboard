require 'coveralls'
Coveralls.wear!

require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

require 'sinatra'
require 'rack/test'
require 'timecop'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

# VCR for recording web interactions
require 'vcr'
VCR.configure do |c|
  c.ignore_hosts 'localhost'
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  # Filter out the environment vars
  JiffyBag.variables.each do |var|
    c.filter_sensitive_data("<#{var}>") { JiffyBag[var] }
  end
end

def app
  HealthBoardApp
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end