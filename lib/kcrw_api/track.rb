class KcrwApi
  class Track
    attr_reader :album_image
    attr_reader :album_image_large
    attr_reader :album
    attr_reader :artist
    attr_reader :label
    attr_reader :spotify_uri
    attr_reader :title
    attr_reader :year

    def initialize(track_hash)
      @album_image = track_hash['albumImage']
      @album_image_large = track_hash['albumImageLarge']
      @album = track_hash['album']
      @artist = track_hash['artist']
      @label = track_hash['label']
      @title = track_hash['title']
      @year = track_hash['year']
      @spotify_uri = spotify_uri
    end

    private

    def spotify_uri
      uri = "https://api.spotify.com/v1/search?q=#{@artist}%20#{@title}&type=track"
      @contents ||= JSON.parse(open(uri).read)
      @spotify_uri ||= @contents['tracks']['items'].first['uri'] if @contents
    end
  end
end
