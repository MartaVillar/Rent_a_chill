require 'test_helper'

class ChillsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chills_index_url
    assert_response :success
  end

  test "should get new" do
    get chills_new_url
    assert_response :success
  end

  test "should get create" do
    get chills_create_url
    assert_response :success
  end

  test "should get update" do
    get chills_update_url
    assert_response :success
  end

  test "should get destroy" do
    get chills_destroy_url
    assert_response :success
  end

end
