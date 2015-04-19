class BestLocationController < ApplicationController
  def find_best
    lat = request.headers['lat']
    long = request.headers['long']
    date = 'current'
    request_duration = 'includecurrent'

    @cloud_json = BestCondition::cycle_through_locations(lat, long, date, request_duration)
  end
end
