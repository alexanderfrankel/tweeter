class User < ActiveRecord::Base

	def twitter_client
		Twitter::REST::Client.new do |config|
	  	config.consumer_key = ENV['CONSUMER_KEY']
	  	config.consumer_secret = ENV['CONSUMER_SECRET']
	  	config.access_token = self.oauth_token
	  	config.access_token_secret = self.oauth_secret
		end
	end

	def self.authenticate(username, password)
    User.where("username = ? AND password = ?", username, password).first
  end

end
