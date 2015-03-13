class CurrentWeatherController < ApplicationController

  def report
    form_request

    require 'net/http'
    @cloud_data = Net::HTTP.get URI.parse(@cloud_url)
    @visibility_data = Net::HTTP.get URI.parse(@visibility_url)

    @cloud_json = JSON.parse(@cloud_data)
    @visibility_json = JSON.parse(@visibility_data)

    @cloud_reply = @cloud_json['ConditionMatched']
    @visibility_reply = @visibility_json['ConditionMatched']

  end

  def form_request
    @base_weather_url = 'http://api.weatherunlocked.com/api/trigger/ '
    @base_api_key = '?app_id=52105b68&app_key=a9477e58897dd522bb12dfc6c45143c9'
    @date = 'current'
    @cloud_criteria = 'cloud lt 40'
    @visibility_criteria = 'visibility gt 5'

    @gps = request.headers['gps']
    @cloud_url = (@base_weather_url + @gps + '/' + @date + ' ' + @cloud_criteria + @base_api_key).gsub(' ', '%20')
    @visibility_url = (@base_weather_url + @gps + '/' + @date + ' ' + @visibility_criteria + @base_api_key).gsub(' ', '%20')
  end


end


