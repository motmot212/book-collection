require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get add" do
    get pages_add_url
    assert_response :success
  end

  test "should get update" do
    get pages_update_url
    assert_response :success
  end

  test "should get details" do
    get pages_details_url
    assert_response :success
  end

  test "should get delete" do
    get pages_delete_url
    assert_response :success
  end
end
