require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get verify_details" do
    get :verify_details
    assert_response :success
  end

  test "should get generate_response" do
    get :generate_response
    assert_response :success
  end

end
