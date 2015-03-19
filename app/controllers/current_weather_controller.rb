class CurrentWeatherController < ApplicationController
  def report
    require 'net/http'
    lat = request.headers['lat']
    long = request.headers['long']
    base_weather_url = 'http://api.weatherunlocked.com/api/trigger/ '
    base_api_key = 'includecurrent?app_id=52105b68&app_key=a9477e58897dd522bb12dfc6c45143c9'
    date = 'current'
    cloud_criteria = 'cloud lt 40'
    @cloud_url = (base_weather_url + lat + ',' + long + '/' + date + ' ' + cloud_criteria + base_api_key).gsub(' ', '%20')
    cloud_data = Net::HTTP.get URI.parse(@cloud_url)
    @cloud_json = JSON.parse(cloud_data)

  end



end


