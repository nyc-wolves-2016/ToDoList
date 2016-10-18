get '/' do
  @lists = List.all.sample(20)
  erb :index
end

get '/sessions/new' do
  if logged_in?
    redirect '/'
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Invalid email or password"]
    erb :'sessions/new'
  end
end

get '/logout' do
  has_user
  session.clear
  redirect '/'
end
