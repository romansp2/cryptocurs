require 'test_helper'

class PairCandlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pair_candles_index_url
    assert_response :success
  end

end
