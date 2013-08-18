require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.actor = create :actor
  end

  test "should get show" do
    get :show, id: @user
    assert_response :redirect
  end

  test "should get new"  do
    get :new
    assert_response :success
  end

  test "should post create" do
    attributes = attributes_for :user
    post :create, user: attributes
    assert_response :redirect

    assert_equal attributes[:login], User.last.login
  end

  test "should get show" do
    get :show, id: @user
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to :root
  end
end
