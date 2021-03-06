class ThreeDayForeCastController < ApplicationController
  def seven_day_request
    require 'net/http'
    lat = request.headers['lat']
    long = request.headers['long']
    date = 'current'
    request_duration = 'include7dayforecast'
    @cloud_json = WeatherObject::build_request(lat, long, date, request_duration)

    if request.headers['Content-Type'] == 'text/html'
      render :mweb_seven_day_report
    else
      # redirect_to(seven_day_report)
    end
  end

  def seven_day_report
    @cloud_json
  end

  def mweb_seven_day_report
    @cloud_json
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