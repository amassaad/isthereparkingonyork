require 'test_helper'

class ParkingControllerTest < ActionController::TestCase
  test "should get check and should queue one job" do
    get :check
    assert_response :success
  end
end
