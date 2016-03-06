require 'test_helper'

class SharedListsControllerTest < ActionController::TestCase
  setup do
    @shared_list = shared_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shared_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shared_list" do
    assert_difference('SharedList.count') do
      post :create, shared_list: { friend_id: @shared_list.friend_id, list_id: @shared_list.list_id, user_id: @shared_list.user_id }
    end

    assert_redirected_to shared_list_path(assigns(:shared_list))
  end

  test "should show shared_list" do
    get :show, id: @shared_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shared_list
    assert_response :success
  end

  test "should update shared_list" do
    patch :update, id: @shared_list, shared_list: { friend_id: @shared_list.friend_id, list_id: @shared_list.list_id, user_id: @shared_list.user_id }
    assert_redirected_to shared_list_path(assigns(:shared_list))
  end

  test "should destroy shared_list" do
    assert_difference('SharedList.count', -1) do
      delete :destroy, id: @shared_list
    end

    assert_redirected_to shared_lists_path
  end
end
