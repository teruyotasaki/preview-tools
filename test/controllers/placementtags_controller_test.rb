require 'test_helper'

class PlacementtagsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
