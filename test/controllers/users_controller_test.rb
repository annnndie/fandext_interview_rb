require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "get new user page" do
    get new_user_path
    assert_template :new
  end

  test "create user succeeded" do
    post users_path, params: { 
      user: { email: 'andie@gmail.com', first_name: 'Andie', last_name: 'Tsai', address: 'QQ' }
    }

    assert_equal "Welcome to fandnext", flash[:success]
    assert_redirected_to users_path
  end

  test "create user failed" do
    post users_path, params: { 
      user: { email: 'andie@gmail.com', first_name: 'Andie' }
    }

    assert_equal "User create failed", flash[:warning]
    assert_template :new
  end
end
