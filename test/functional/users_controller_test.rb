require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new"  do
    get :new
    assert_response :success
  end

  test "should post create" do
    attributes = { login: @user.login, password: @user.password }
    post :create, user: attributes
    assert_response :success

    assert_equal attributes[:login], User.last.login
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to :root
  end
end
