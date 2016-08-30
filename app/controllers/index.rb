get '/' do
  redirect :'/sessions'
end

post '/' do
  artist = SpotifyArtist.new(params[:artist])
  @ra_data = artist.related_artists
  @artist = artist.artist_data[0]
  erb :'show_artists'
end
