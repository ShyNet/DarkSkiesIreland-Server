require 'test_helper'

class BestLocationControllerTest < ActionController::TestCase
  test "should get build_gps_points" do
    get :build_gps_points
    assert_response :success
  end

  test "should get find_best" do
    get :find_best
    assert_response :success
  end

end
