require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    attributes = { login: @user.login, password: @user.password }
    post :create, user: attributes
    assert_redirected_to :root
    assert user_signed_in?
  end

  test "should destroy session" do
    delete :destroy
    assert !user_signed_in?
  end
end
