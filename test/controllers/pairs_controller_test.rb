require 'test_helper'

class PairsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pairs_show_url
    assert_response :success
  end

end
