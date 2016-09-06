get '/artist' do
  redirect :'/'
end

post '/artist' do
    artist = SpotifyArtist.new(params[:name])
    ra_data = artist.related_artists
    head_artist = artist.artist_data[0]
  if request.xhr?
    content_type :html
    erb :_related_artist, locals: {head_artist: head_artist, ra_data: ra_data}, layout: false
  else
    @ra_data = artist.related_artists
    @artist = artist.artist_data[0]
    @popularity = artist.artist_data[1]
    @genre = artist.artist_data[3][0]
  erb :'flakes/show'
  end
end

post '/artist_circle' do
    artist = SpotifyArtist.new(params[:name])
    ra_data = artist.related_artists
    head_artist = artist.artist_data[0]
  if request.xhr?
    content_type :html
    erb :_related_artist_circle, locals: {head_artist: head_artist, ra_data: ra_data}, layout: false
  else
    @ra_data = artist.related_artists
    @artist = artist.artist_data[0]
    @popularity = artist.artist_data[1]
    @genre = artist.artist_data[3][0]
  erb :'flakes/show'
  end
end
