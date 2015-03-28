class CurrentWeatherController < ApplicationController
  def show_current
    @lat = request.headers['lat']
    @long = request.headers['long']
    @date = 'current'
    @cloud_json = WeatherObject::get_results(@lat, @long, @date)
  end
end


