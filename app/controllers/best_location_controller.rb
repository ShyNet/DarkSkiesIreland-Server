class BestLocationController < ApplicationController
  def find_best
    lat = request.headers['lat']
    long = request.headers['long']
    date = 'current'
    request_duration = 'includecurrent'

    @cloud_json = BestCondition::cycle_through_locations(lat, long, date, request_duration)

    response.headers['lat'] = (@cloud_json['CurrentWeather']['lat']).to_s
    response.headers['long'] = (@cloud_json['CurrentWeather']['lon']).to_s

    if request.headers['Content-Type'] == 'text/html'
      render :mobile_web
    end
  end

  def mobile_web

  end
end
