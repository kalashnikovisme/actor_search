require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @photo = create :photo
    @user = create :user
  end

  test "should get new" do
    user_sign_in @user

    get :new, id: @user
    assert_response :success
  end

  test "should post create" do
    user_sign_in @user

    attributes = attributes_for :photo
    attributes[:user_id] = @user.id
    post :create, id: @user, photo: attributes
    assert_response :success
    #assert_equal @user.id, Photo.last.user.id
  end

  test "should destroy photo" do
    user_sign_in @user

    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_response :success
  end

end
