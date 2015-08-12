require 'rspec/core/rake_task'

desc "run specs"
RSpec::Core::RakeTask.new

task :default => [:spec]

namespace :fitbit do

  desc "authenticate with fitbit"
  task :auth, [:consumer_key, :consumer_secret] do |t, args|
    require 'fitgem'
    
    client = Fitgem::Client.new(
      consumer_key: args.consumer_key,
      consumer_secret: args.consumer_secret,
    )    
    request_token = client.request_token
    token = request_token.token
    secret = request_token.secret
    print "Go to http://www.fitbit.com/oauth/authorize?oauth_token=#{token} and then enter the verifier code here: "
    verifier = STDIN.gets.chomp

    begin
      access_token = client.authorize(token, secret, { :oauth_verifier => verifier })
    rescue Exception => e
      puts "Error: Could not authorize Fitgem::Client with supplied oauth verifier"
      exit
    end
    
    File.open(".env", "w") do |f|
      f.write "FITBIT_CONSUMER_KEY: #{args.consumer_key}\n"
      f.write "FITBIT_CONSUMER_SECRET: #{args.consumer_secret}\n"
      f.write "FITBIT_USER_TOKEN: #{access_token.token}\n"
      f.write "FITBIT_USER_SECRET: #{access_token.secret}\n"
    end
    
  end

end