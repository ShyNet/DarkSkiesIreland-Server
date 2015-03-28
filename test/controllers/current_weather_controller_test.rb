require 'test_helper'

class CurrentWeatherControllerTest < ActionController::TestCase
  test "should get report" do
    get :show_current
    assert_response :success
  end

end
