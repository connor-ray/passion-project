# USERS INDEX
get '/users' do
  redirect "/"
end

# USERS NEW
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = params[:user]
  if params[:password_confirmation] == user[:password]
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      erb :'artist'
    else
      @errors = @user.errors.full_messages
      erb :'error'
    end
  else
    @errors = ["Passwords do not match!"]
    erb :'index'
  end
end
