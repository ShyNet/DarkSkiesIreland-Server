class ThreeDayForecast < ActiveRecord::Base

  lat = request.headers['lat']
  long = request.headers['long']
  date = 'current'
  request_duration = 'include7dayforecast'
  @cloud_json = WeatherObject::build_request(lat, long, date, request_duration)

end
