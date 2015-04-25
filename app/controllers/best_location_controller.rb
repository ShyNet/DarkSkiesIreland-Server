class BestLocationController < ApplicationController
  def find_best
    lat = request.headers['lat']
    long = request.headers['long']
    date = 'current'
    request_duration = 'includecurrent'

    @cloud_json = BestCondition::cycle_through_locations(lat, long, date, request_duration)

    if request.headers['Content-Type'] == 'text/html'
      render :mobile_web
    end
  end

  def mobile_web
    request.headers['lat', @cloud_json['CurrentWeather']['lat'], 'long', @cloud_json['CurrentWeather']['long']]
  end
end
