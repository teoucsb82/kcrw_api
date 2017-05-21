require 'minitest/autorun'
require 'kcrw_api'

class KcrwApiTest < Minitest::Test
  extend Minitest::Spec::DSL
  let(:kcrw_api) { KcrwApi.new(date_time) }
  let(:date_time) { DateTime.new(2017, 5, 19, 9, 00) }

  def test_endpoint
    assert_equal kcrw_api.endpoint, "https://tracklist-api.kcrw.com/Music/date/2017/05/19?time=09%3A00"
  end

  def test_tracks
    assert_equal kcrw_api.tracks.length, 10
  end
end
