require "test_helper"

class CounterpartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get counterparties_index_url
    assert_response :success
  end

  test "should get new" do
    get counterparties_new_url
    assert_response :success
  end

  test "should get create" do
    get counterparties_create_url
    assert_response :success
  end

  test "should get edit" do
    get counterparties_edit_url
    assert_response :success
  end

  test "should get update" do
    get counterparties_update_url
    assert_response :success
  end

  test "should get destroy" do
    get counterparties_destroy_url
    assert_response :success
  end
end
