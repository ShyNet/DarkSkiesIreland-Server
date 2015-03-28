require 'test_helper'

class SevenDayForeCastControllerTest < ActionController::TestCase
  test "should get seven_day_report" do
    get :seven_day_report
    assert_response :success
  end

end
