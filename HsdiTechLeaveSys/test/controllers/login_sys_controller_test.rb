require 'test_helper'

class LoginSysControllerTest < ActionDispatch::IntegrationTest
  test "should get login_pag" do
    get login_sys_login_pag_url
    assert_response :success
  end

end
