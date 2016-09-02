get '/' do
  if session[:id]
    erb :'artist'
  else
  redirect :'/sessions'
  end
end

post '/' do
    artist = SpotifyArtist.new(params[:name])
    @ra_data = artist.related_artists
    @artist = artist.artist_data[0]
    erb :'show_artists'
end


