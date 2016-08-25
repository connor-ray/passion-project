require 'rspotify'
require 'json'

RSpotify::authenticate("320b1e5fbb0246c7aa938a0e495e6b8d", "F573a0ee8b594dd49da01ecffe04f997")

def related_artists
      return @related_artists unless @related_artists.nil? || RSpotify.raw_response
      response = RSpotify.get("artists/#{@id}/related-artists")

      return response if RSpotify.raw_response
      @related_artists = response['artists'].map { |a| Artist.new a }
end


RSpotify.raw_response = true
str = RSpotify::Artist.search('Arctic Monkeys')
artist = JSON.parse(str)

str = RSpotify::Artist.search('Arctic Monkeys')
prs = JSON.parse(str)
info = prs.first
artist = info[1]
ary = artist["items"]
items = ary.first
name = items["name"]
popularity = items["popularity"]
artist_info = {"popularity" => popularity, "name" => name}
artist_init = RSpotify::Artist.new(artist_info)
p artist_init
# p artist_init.related_artists
# genres = arctic_monkeys.genres
# top_tracks = arctic_monkeys.top_tracks(:US)
# artist_info = {popularity: popularity, genres: genres, name: name}
# init_artist = RSpotify::Artist.new(artist_info)
# p init_artist

# def spotify
#     spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
#     # Now you can access user's private data, create playlists and much more

#     # Access private data
#     spotify_user.country #=> "US"
#     spotify_user.email   #=> "example@email.com"

#     # Create playlist in user's Spotify account
#     playlist = spotify_user.create_playlist!('my-awesome-playlist')

#     # Add tracks to a playlist in user's Spotify account
#     tracks = RSpotify::Track.search('Know')
#     playlist.add_tracks!(tracks)
#     playlist.tracks.first.name #=> "Somebody That I Used To Know"

#     # Access and modify user's music library
#     spotify_user.save_tracks!(tracks)
#     spotify_user.saved_tracks.size #=> 20
#     spotify_user.remove_tracks!(tracks)

#     albums = RSpotify::Album.search('launeddas')
#     spotify_user.save_albums!(albums)
#     spotify_user.saved_albums.size #=> 10
#     spotify_user.remove_albums!(albums)

#     # Use Spotify Follow features
#     spotify_user.follow(playlist)
#     spotify_user.follows?(artists)
#     spotify_user.unfollow(users)

#     # Get user's top played artists and tracks
#     spotify_user.top_artists #=> (Artist array)
#     spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)

#     # Check doc for more
#   end

#   p spotify
