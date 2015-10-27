require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get edit_prefs" do
    get :edit_prefs
    assert_response :success
  end

end
