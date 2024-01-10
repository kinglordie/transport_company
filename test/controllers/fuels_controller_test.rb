require "test_helper"

class FuelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fuels_index_url
    assert_response :success
  end

  test "should get new" do
    get fuels_new_url
    assert_response :success
  end

  test "should get create" do
    get fuels_create_url
    assert_response :success
  end
end
