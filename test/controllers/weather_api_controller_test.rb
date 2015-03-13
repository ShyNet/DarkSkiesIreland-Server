require 'test_helper'

class WeatherApiControllerTest < ActionController::TestCase
  test "should get current_weather" do
    get :current_weather
    assert_response :success
  end

  test "should get forecast" do
    get :forecast
    assert_response :success
  end

end
