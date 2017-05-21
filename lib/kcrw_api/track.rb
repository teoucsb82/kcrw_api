class KcrwApi
  class Track
    attr_reader :album_image
    attr_reader :album_image_large
    attr_reader :album
    attr_reader :artist
    attr_reader :label
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
    end
  end
end
