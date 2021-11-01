require "test_helper"

class Admins::AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_index_url
    assert_response :success
  end
end
