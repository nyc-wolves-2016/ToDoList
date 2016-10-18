def current_user
  @user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def has_user
  if !logged_in?
    redirect '/'
  end
end
