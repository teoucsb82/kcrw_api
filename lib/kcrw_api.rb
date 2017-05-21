require 'date'
require 'open-uri'
require 'json'

class KcrwApi
  BASE = 'https://tracklist-api.kcrw.com/Music/date'.freeze

  def initialize(date_time)
    @date_time = date_time
  end

  def endpoint
    "#{BASE}/#{date}?time=#{time}"
  end

  def tracks
    @contents ||= URI.parse(endpoint).read
    JSON.parse(@contents).each do |track|
      Track.new(track)
    end
  end

  private

  def date
    "#{year}/#{month}/#{day}"
  end

  def day
    @date_time.day < 10 ? "0#{@date_time.day}" : @date_time.day
  end

  def hour
    @date_time.hour < 10 ? "0#{@date_time.hour}" : @date_time.hour
  end

  def minute
    @date_time.minute < 10 ? "0#{@date_time.minute}" : @date_time.minute
  end

  def month
    @date_time.month < 10 ? "0#{@date_time.month}" : @date_time.month
  end

  def time
    "#{hour}%3A#{minute}"
  end

  def year
    @date_time.year
  end
end

require 'kcrw_api/track'
