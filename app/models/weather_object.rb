class WeatherObject < ActiveRecord::Base

  def self.build_request(lat, long, date, request_range)
    require 'net/http'
    @base_weather_url = 'http://api.weatherunlocked.com/api/trigger/ '
    @base_api_key = request_range + '?app_id=52105b68&app_key=a9477e58897dd522bb12dfc6c45143c9'
    @cloud_criteria = 'cloud lt 40'
    @cloud_url = (@base_weather_url + lat + ',' + long + '/' + date + ' ' + @cloud_criteria + @base_api_key).gsub(' ', '%20')
    @cloud_data = Net::HTTP.get URI.parse(@cloud_url)
    @response_json = JSON.parse(@cloud_data)
  end

end