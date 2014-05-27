get '/' do
  erb :index
end

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

# this is the callback...........
get '/auth' do
  access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])  
  User.create(username: access_token.params["screen_name"], oauth_token: access_token.token, oauth_secret: access_token.secret)

  
  session.delete(:request_token)
  erb :index
end
