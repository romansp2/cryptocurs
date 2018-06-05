require 'test_helper'

class CryptoCursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crypto_curs_index_url
    assert_response :success
  end

end
