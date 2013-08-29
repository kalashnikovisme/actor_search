require 'test_helper'

class AccessesControllerTest < ActionController::TestCase
  setup do
    @searcher = create :searcher
    user_sign_in @searcher
    @access = create :access
  end

  test "should get index" do
    get :index, id: @searcher
    assert_response :success
  end

  test "should get new" do
    get :new, id: @searcher
    assert_response :success
  end

  test "should post create" do
    attributes = attributes_for :access
    post :create, access: attributes, id: @searcher
    assert_response :redirect

    assert_equal attributes[:user_id], Access.last.user_id
  end

  test "should destroy access" do
    searcher = Searcher.find @access.searcher_id
    assert_difference('Access.count', -1) do
      delete :destroy, id: @access
    end

    assert_redirected_to searcher_path searcher
  end
end
