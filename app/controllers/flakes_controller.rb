get '/flakes' do
  id = session[:id]
  user = User.find_by(id: id)
  flakes = user.flakes
  if request.xhr?
    content_type :html
    erb :_flake, locals: {flakes: flakes}, layout: false
  end
end

post '/flakes' do
  id = session[:id]
  artist = params[:name]
  args = {artist: artist, user_id: id}
  flake = Flake.new(args)
  user = User.find_by(id: id)
  flakes = user.flakes
  if flake.save
    if request.xhr?
    end
  else
    redirect :'/'
  end
end
