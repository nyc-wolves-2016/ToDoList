get '/users/new' do
  if logged_in?
    direct '/'
  else
    erb :'users/register'
  end
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/register'
  end
end

get '/users/:id' do
  @user = current_user
  erb :'/users/show'
end
