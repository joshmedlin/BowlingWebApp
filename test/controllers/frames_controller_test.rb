require 'test_helper'

class FramesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get frames_new_url
    assert_response :success
  end

  test "should get show" do
    get frames_show_url
    assert_response :success
  end

  test "should get next" do
    get frames_next_url
    assert_response :success
  end

end
