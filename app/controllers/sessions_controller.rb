get '/sessions' do
  erb :'sessions/new'
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect '/'
  else
    # pls ppl yell at me about making a errros partial after......
    @errors = ["Username && Password not found."]
    erb :'sessions/new'
  end
end



# delete '/sessions/:id' do
delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
