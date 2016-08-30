require_relative 'api_test'

get '/' do
  erb :'index'
end


post '/' do
  @artist = SpotifyArtist.new(params[:artsit])
  @artist.related_artists

  erb :'show_artists'
end
