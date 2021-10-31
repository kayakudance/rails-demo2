require "test_helper"

class CompletesControllerTest < ActionDispatch::IntegrationTest
  test "should get order" do
    get completes_order_url
    assert_response :success
  end
end
