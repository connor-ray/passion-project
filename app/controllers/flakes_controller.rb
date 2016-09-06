get '/flakes' do
  @flakes = Flake.all
end

post '/flakes' do
  id = session[:id]
  flake = Flake.new(params[:name], id)
  user = User.find_by(user_id: id)
  flakes = user.flakes
  if flake.save
    if request.xhr?
      content_type :html
      erb :_flake, locals: {flakes: flakes}
    end
  else
    redirect :'/'
  end
end

