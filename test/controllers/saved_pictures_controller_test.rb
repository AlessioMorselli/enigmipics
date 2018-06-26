require 'test_helper'

class SavedPicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_picture = saved_pictures(:one)
  end

  test "should get index" do
    get saved_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_picture_url
    assert_response :success
  end

  test "should create saved_picture" do
    assert_difference('SavedPicture.count') do
      post saved_pictures_url, params: { saved_picture: { description: @saved_picture.description } }
    end

    assert_redirected_to saved_picture_url(SavedPicture.last)
  end

  test "should show saved_picture" do
    get saved_picture_url(@saved_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_picture_url(@saved_picture)
    assert_response :success
  end

  test "should update saved_picture" do
    patch saved_picture_url(@saved_picture), params: { saved_picture: { description: @saved_picture.description } }
    assert_redirected_to saved_picture_url(@saved_picture)
  end

  test "should destroy saved_picture" do
    assert_difference('SavedPicture.count', -1) do
      delete saved_picture_url(@saved_picture)
    end

    assert_redirected_to saved_pictures_url
  end
end
