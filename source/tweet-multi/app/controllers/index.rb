get '/' do
  @session_user = session[:user_id]
  erb :index
end