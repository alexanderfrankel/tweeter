get '/sign_in_native' do
  erb :sign_in_native
end

post '/sign_in_native' do
	# user = User.authenticate(params[:username], params[:password])
	 
end
	
get '/new_account' do
	erb :new_account
end

post '/new_account' do
  session[:user_id] = User.where(username: params[:username]).first_or_create(oauth_token: access_token.token, oauth_secret: access_token.secret).id
end