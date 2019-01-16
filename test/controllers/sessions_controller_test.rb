require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"
  end

  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    dave = users(:one)
    post login_url, params: { name: dave.name, password: 'secret' }
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end

  test "should fail login" do
    dave = users(:one)
    post login_url, params: { name: dave.name, password: 'wrong' }
  end

  test "should logout" do
    delete logout_url
    assert_redirected_to store_index_url
  end

  test "should logout attempt to create product" do

    delete logout_url

    # post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
    assert_nil session[:user_id]
    patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }

  end
  # test "should get new" do
  #   get sessions_new_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get sessions_create_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get sessions_destroy_url
  #   assert_response :success
  # end

end
