require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  setup do
    @actor = create :actor
    @user = create :user
  end

  test "should get show" do
    get :show, id: @actor
    assert_response :redirect
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    user_sign_in @user

    get :new
    assert_response :success
  end

  test "should post create" do
    user_sign_in @user

    attributes = attributes_for :actor
    attributes[:user_id] = @user.id
    post :create, actor: attributes
    assert_response :redirect

    assert_equal attributes[:user_id], Actor.last.user.id
  end

  test "should get edit" do
    user_sign_in @actor.user

    get :edit, id: @actor
    assert_response :success
  end

  test "should put update" do
    user_sign_in @actor.user

    attributes = attributes_for :actor
    attributes[:user_id] = @actor.user.id
    put :update, id: @actor, actor: attributes
    assert_redirected_to actor_path @actor

    @actor.reload
    assert_equal attributes[:user_id], @actor.user.id
  end

  test "should destroy actor" do
    user_sign_in @actor.user

    assert_difference('Actor.count', -1) do
      delete :destroy, id: @actor
    end

    assert_redirected_to :root
  end
end
