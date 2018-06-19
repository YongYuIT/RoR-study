require 'test_helper'

class ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get conn_test" do
    get chat_conn_test_url
    assert_response :success
  end

end
