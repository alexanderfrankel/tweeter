get '/sign_in_native' do
  erb :sign_in_native
end

post '/sign_in_native' do
	user = User.authenticate(params[:username], params[:password])
	if user
		puts "i found a user"
	else
		puts "no user here!"
	end
	# should set session, but does not make sense yet
	# if invalid, should redirect to same page
	# session[:user_id] = user.id if user
	redirect '/'
end
	
get '/new_account' do
	erb :new_account
end

post '/new_account' do
	# needs to set session, but doesnt make sense yet
	# should send error message if username already exists
  User.where(username: params[:username]).first_or_create(password: params[:password]).id
  redirect '/'
end