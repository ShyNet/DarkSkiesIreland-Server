require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get add_user" do
    get :add_user
    assert_response :success
  end

end
