require 'httparty'

class SpotifyArtist
  include HTTParty
  base_uri 'https://api.spotify.com/v1'


  attr_reader :artist_name, :popularity, :id, :genres

  def initialize(artist)
    @artist_search = artist
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
    self.class.get("/search?q=#{name}&type=artist", header: {"Accept" => "application/json"})
  end
end

def parse_data(json_object)
  data = []
  object_hash = json_object.first[1]['items'][0]
  data << object_hash["name"]
  data << object_hash["popularity"]
  data << object_hash["id"]
  data << object_hash["genres"]
end

search = "Rolling Stones"

rstone = SpotifyArtist.new(search)
search = rstone.search
artist_data = parse_data(search)
p artist_data
# a = search.first[1]['items'][0]
# p a.class

# ["external_urls", "followers", "genres", "href", "id", "images", "name", "popularity", "type", "uri"]
