class CurrentWeatherController < ApplicationController
  def show_current
    lat = request.headers['lat']
    long = request.headers['long']
    date = 'current'
    request_duration = 'includecurrent'

    @cloud_json = WeatherObject::build_request(lat, long, date, request_duration)

    if request.headers['Content-Type'] == 'text/html'
      render :mobile_web
    end
  end

  def mobile_web

  end
end


