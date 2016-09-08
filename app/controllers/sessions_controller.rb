get '/sessions' do
  if session[:id]
    erb :'index'
  else
  redirect :'/sessions/new'
  end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect :"/users/#{session[:id]}"
  else
    @errors = ["Username && Password not found."]
    redirect :'users/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect :'/'
end
