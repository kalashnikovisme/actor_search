require 'test_helper'

class SearchersControllerTest < ActionController::TestCase
  setup do
    @searcher = create :searcher
    @user = create :user
  end

  test "should get show" do
    user_sign_in @user

    get :show, id: @searcher
    assert_response :success
  end

  test "should get new" do
    user_sign_in @user

    get :new
    assert_response :success
  end

  test "should post create" do
    user_sign_in @user

    attributes = attributes_for :searcher
    attributes[:user_id] = @user.id
    post :create, searcher: attributes, id: @user
    assert_response :redirect

    assert_equal attributes[:user_id], Searcher.last.user.id
  end

  test "should get edit" do
    user_sign_in @searcher.user

    get :edit, id: @searcher
    assert_response :success
  end

  test "should put update" do
    user_sign_in @searcher.user

    attributes = attributes_for :searcher
    attributes[:user_id] = @searcher.user.id
    put :update, id: @searcher, searcher: attributes
    assert_redirected_to searcher_path @searcher

    @searcher.reload
    assert_equal attributes[:user_id], @searcher.user.id
  end

  test "should destroy searcher" do
    user_sign_in @searcher.user

    assert_difference('Searcher.count', -1) do
      delete :destroy, id: @searcher
    end

    assert_redirected_to :root
  end
end
