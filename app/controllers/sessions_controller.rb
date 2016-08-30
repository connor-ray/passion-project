get '/sessions' do
  erb :'sessions/new'
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = params[:user]
  @user = User.find_by_email(user[:email])
  if @user == nil
    @user = User.new(params[:user])
    session[:id] = @user.id
    erb 'index'
  elsif @user && @user.password == params[:password]
    session[:id] = @user.id
    erb 'index'
  else
    # pls ppl yell at me about making a errros partial after......
    @errors = ["Username && Password not found."]
    erb :'index'
  end
end


# delete '/sessions/:id' do
delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
