require 'httparty'

class SpotifyArtist
  include HTTParty
  base_uri 'https://api.spotify.com/v1'


  attr_reader :artist_name, :popularity, :id, :genres

  def initialize(artist)
    @artist_search = artist
    @json = nil
    @id = nil
    @artist_data = []
    @related_artists = []
    @ra_json = nil
  end

  def search_prep(artist)
    split = artist.chars
    split.map! do |char|
      if char == " "
        char = "+"
      else
        char
      end
    end
    split.join
  end

  def search
    name = search_prep(@artist_search)
    @json = self.class.get("/search?q=#{name}&type=artist", header: {"Accept" => "application/json"})
  end

  def parse_data
    object_hash = @json.first[1]['items'][0]
    @artist_data << object_hash["name"]
    @artist_data << object_hash["popularity"]
    @artist_data << object_hash["id"]
    @artist_data << object_hash["genres"]
  end

  def parse_related_artists

  end

  def related_artists
    self.search
    self.parse_data
    id = @artist_data[2]
    id
    @ra_json = self.class.get("/artists/#{id}/related-artists", header: {"Accept" => "application/json"})
  end
end

search = "Rolling Stones"

rolling = SpotifyArtist.new(search)

a = rolling.related_artists
p a.first
# def parse_data(json_object)
#   data = []
#   object_hash = json_object.first[1]['items'][0]
#   data << object_hash["name"]
#   data << object_hash["popularity"]
#   data << object_hash["id"]
#   data << object_hash["genres"]
# end

# search = "Rolling Stones"

# rstone = SpotifyArtist.new(search)
# search = rstone.search
# artist_data = parse_data(search)
# p artist_data
# # a = search.first[1]['items'][0]
# # p a.class

# ["external_urls", "followers", "genres", "href", "id", "images", "name", "popularity", "type", "uri"]
