require "test_helper"

class RequestersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requesters_index_url
    assert_response :success
  end

  test "should get show" do
    get requesters_show_url
    assert_response :success
  end
end
