require "test_helper"

class PolyCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get poly_comments_edit_url
    assert_response :success
  end
end
