#sign in using twitter----------
get '/sign_in_twitter' do
  session.delete(:request_token)
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

# this is the callback...........
get '/auth' do
  access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])  

  session[:user_id] = User.where(twitter_name: access_token.params["screen_name"]).first_or_create(oauth_token: access_token.token, oauth_secret: access_token.secret).id

  @session_user = session[:user_id]

  session.delete(:request_token)
  erb :index
end

# post request sent from ajax-----
post '/tweet' do
  User.find(session[:user_id]).twitter_client.update(params[:tweet])
end