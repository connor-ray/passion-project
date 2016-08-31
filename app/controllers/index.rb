get '/' do
  if session[:id]
    erb :'index'
  else
  redirect :'/sessions'
  end
end

post '/artist' do
  # if request.xhr?
    artist = SpotifyArtist.new(params[:name])
    @ra_data = artist.related_artists
    @artist = artist.artist_data[0]
    erb :'users/show'
  #   hash = {"related_artists": @ra_data, "artist": @artist}
  #   JSON.generate(hash)
  # else
  #   redirect '/'
  # end
end


