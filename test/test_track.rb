require 'minitest/autorun'
require 'kcrw_api'

class TrackTest < Minitest::Test
  extend Minitest::Spec::DSL
  let(:track) { KcrwApi::Track.new(track_hash) }
  let(:json) { File.read(File.expand_path('../../fixtures/track.json', __FILE__)) }
  let(:track_hash) { JSON.parse(json) }

  def test_attributes
    assert_equal track.album_image, 'https://images-na.ssl-images-amazon.com/images/I/41p2cgeF0PL._SL75_.jpg'
    assert_equal track.album_image_large, 'https://images-na.ssl-images-amazon.com/images/I/41p2cgeF0PL._SL300_.jpg'
    assert_equal track.album, 'Bellyache (remixes)'
    assert_equal track.artist, 'Billie Eilish'
    assert_equal track.label, 'Darkroom/Interscope Records'
    assert_equal track.title, 'Bellyache (Marian Hill Remix)'
    assert_equal track.year, 2017
  end
end
