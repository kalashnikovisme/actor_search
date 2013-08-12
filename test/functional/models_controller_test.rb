require 'test_helper'

class ModelsControllerTest < ActionController::TestCase
  setup do
    @model = create :model
    @user = create :user
  end

  test "should get new" do
    user_sign_in @user

    get :new
    assert_response :success
  end

  test "should post create" do
    user_sign_in @user

    attributes = attributes_for :model
    attributes[:user_id] = @user.id
    post :create, model: attributes
    assert_response :redirect

    assert_equal attributes[:user_id], Model.last.user.id
  end

  test "should get edit" do
    user_sign_in @model.user

    get :edit, id: @model
    assert_response :success
  end

  test "should put update" do
    user_sign_in @model.user

    attributes = attributes_for :model
    attributes[:user_id] = @model.user.id
    put :update, id: @model, model: attributes
    assert_redirected_to model_path @model

    @model.reload
    assert_equal attributes[:user_id], @model.user.id
  end

  test "should destroy model" do
    user_sign_in @model.user

    assert_difference('Model.count', -1) do
      delete :destroy, id: @model
    end

    assert_redirected_to :root
  end
end
