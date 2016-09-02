post '/artist' do
  artist = SpotifyArtist.new(params[:name])
  @ra_data = artist.related_artists
  @artist = artist.artist_data[0]
  @popularity = artist.artist_data[1]
  @genre = artist.artist_data[3][0]
  erb :'show_artists'
end
