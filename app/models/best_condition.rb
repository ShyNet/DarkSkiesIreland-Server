class BestCondition < ActiveRecord::Base
  def self.cycle_through_locations(lat, long, date)
    gps_north = lat.to_f + 0.25
    gps_east = long.to_f + 0.25
    gps_south = lat.to_f - 0.25
    gps_west = long.to_f - 0.25
    @date = date
    temp_lat = lat.to_f
    temp_long = long.to_f

    coordinate_array = [[gps_north, temp_long], [gps_north,gps_east], [temp_lat, gps_east], [gps_south, gps_east],
                        [gps_south, temp_long], [gps_south, gps_west], [temp_lat, gps_west], [gps_north, gps_west]]

    best_json_response = WeatherObject::get_results(temp_lat.to_s, temp_long.to_s, @date)
    coordinate_array.each do |c_a|
      @best_conditions = best_json_response['CurrentWeather']['cloudtotal_pct']
      @json_results = WeatherObject::get_results(c_a[0].to_s,c_a[1].to_s , @date)
      @temp_conditions = @json_results['CurrentWeather']['cloudtotal_pct']
      if @best_conditions > @temp_conditions
        @temp_lat = c_a[0]
        @temp_long = c_a[1]
        @best_conditions = @temp_conditions
        @best_json_response = @json_results
      end
    end
    best_json_response

  end
end
