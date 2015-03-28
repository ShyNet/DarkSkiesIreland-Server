class SevenDayForeCastController < ApplicationController
  def seven_day_report
    require 'net/http'
    lat = request.headers['lat']
    long = request.headers['long']
    base_weather_url = 'http://api.weatherunlocked.com/api/trigger/ '
    base_api_key = 'include7dayforecast?app_id=52105b68&app_key=a9477e58897dd522bb12dfc6c45143c9'
    date = 'current'
    cloud_criteria = 'cloud lt 40'
    @cloud_url = (base_weather_url + lat + ',' + long + '/' + date + ' ' + cloud_criteria + base_api_key).gsub(' ', '%20')
    cloud_data = Net::HTTP.get URI.parse(@cloud_url)
    @cloud_json = JSON.parse(cloud_data)

  end

  def get_weather_desc(cloud_json, day, timeframe)
    case cloud_json['ForecastWeather']['Days'][day]['Timeframes'][timeframe]['wx_code']
      when 0
        'Clear Skies'
      when 1
        'Partly cloudy skies'
      when 2
        'Cloudy skies'
      when 3
        'Overcast skies'
      else
        'undefined'
    end
  end

  helper_method :get_weather_desc
end