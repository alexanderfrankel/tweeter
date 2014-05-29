class User < ActiveRecord::Base
	include BCrypt

	def twitter_client
		Twitter::REST::Client.new do |config|
	  	config.consumer_key = ENV['CONSUMER_KEY']
	  	config.consumer_secret = ENV['CONSUMER_SECRET']
	  	config.access_token = self.oauth_token
	  	config.access_token_secret = self.oauth_secret
		end
	end

	# bcrypt password----------------------------------

	def self.authenticate(username, password)
		user = User.find_by_username(username)
		return user if user && (user.password == password)
		nil
	end

  def password
	  @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
