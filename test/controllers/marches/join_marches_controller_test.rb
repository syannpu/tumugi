require "test_helper"

class Marches::JoinMarchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marches_join_marches_index_url
    assert_response :success
  end

  test "should get update" do
    get marches_join_marches_update_url
    assert_response :success
  end
end
