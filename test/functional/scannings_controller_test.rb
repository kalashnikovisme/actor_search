require 'test_helper'

class ScanningsControllerTest < ActionController::TestCase
  setup do
    @scanning = create :scanning
    @user = create :user
  end

  test "should get show" do
    get :show, id: @scanning
    assert_response :success
  end

  test "should get index" do
    get :index, id: @searcher
    assert_response :success
  end

  test "should get new" do
    user_sign_in @user

    get :new, id: @searcher
    assert_response :success
  end

  test "should post create" do
    user_sign_in @user

    attributes = attributes_for :scanning
    attributes[:seacher_id] = @searcher.id
    post :create, scanning: attributes
    assert_response :redirect

    assert_equal attributes[:searcher_id], Scanning.last.searcher.id
  end

  test "should get edit" do
    user_sign_in @scanning.searcher.user

    get :edit, id: @scanning
    assert_response :success
  end

  test "should put update" do
    user_sign_in @scanning.user

    attributes = attributes_for :scanning
    attributes[:searcher_id] = @scanning.searcher.id
    put :update, id: @scanning, scanning: attributes
    assert_redirected_to scanning_path @scanning

    @scanning.reload
    assert_equal attributes[:searcher_id], @scanning.seacher.id
  end

  test "should destroy scanning" do
    user_sign_in @scanning.user

    assert_difference('Scanning.count', -1) do
      delete :destroy, id: @scanning
    end

    assert_redirected_to :root
  end
end
