require "test_helper"

class TruckRepairsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get truck_repairs_index_url
    assert_response :success
  end

  test "should get new" do
    get truck_repairs_new_url
    assert_response :success
  end

  test "should get create" do
    get truck_repairs_create_url
    assert_response :success
  end
end
