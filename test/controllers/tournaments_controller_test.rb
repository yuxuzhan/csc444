require 'test_helper'

class TournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tournaments_new_url
    assert_response :success
  end

end
