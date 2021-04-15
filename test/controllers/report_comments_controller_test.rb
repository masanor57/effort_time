require 'test_helper'

class ReportCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get report_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get report_comments_destroy_url
    assert_response :success
  end

end
