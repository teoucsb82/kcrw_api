require 'minitest/autorun'
require 'kcrw_api'

class KcrwApiTest < Minitest::Test
  extend Minitest::Spec::DSL
  let(:kcrw_api) { KcrwApi.new(date_time) }
  let(:tracklist) { File.read(File.expand_path('../../fixtures/tracklist.json', __FILE__)) }
  let(:date_time) { DateTime.new(2017, 5, 9, 9) }

  def test_tracks
    assert_equal kcrw_api.tracks.length, JSON.parse(tracklist).length
  end
end
