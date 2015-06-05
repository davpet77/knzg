require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test "should get usr_signup" do
    get :usr_signup
    assert_response :success
  end

  test "should get usr_login" do
    get :usr_login
    assert_response :success
  end

end
