class SpotifyArtist
  include HTTParty
  base_uri 'https://api.spotify.com/v1'


  attr_reader :artist_data, :name, :popularity, :id, :genres, :ra_json

  def initialize(artist)
    @artist_search = artist
    @json = nil
    @artist_data = []
    @id = @artist_data[2]
    @name = @artist_data[0]
    @genres = @artist_data[3]
    @popularity = @artist_data[1]
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

  def parse_related_artists(array)
    array.map! do |artist|
      artist.select { |key, value| ["name", "popularity", "id", "genres"].include?(key) }
    end
  end

  def related_artists
    self.search
    self.parse_data
    id = @artist_data[2]
    json = self.class.get("/artists/#{id}/related-artists", header: {"Accept" => "application/json"})
    @ra_json = json.first[1]
    parse_related_artists(@ra_json)
  end

end
