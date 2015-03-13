require 'test_helper'

class CurrentWeatherControllerTest < ActionController::TestCase
  test "should get report" do
    get :report
    assert_response :success
  end

end
