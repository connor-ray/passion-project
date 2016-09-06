# USERS INDEX
get '/users' do
  redirect "/"
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = params[:user]
  if params[:password_confirmation] == user[:password]
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect :'/'
    else
      @errors = @user.errors.full_messages
      erb :'error'
    end
  else
    @errors = ["Passwords do not match!"]
    erb :'index'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @flakes = @user.flakes
  erb :'users/show'
end
