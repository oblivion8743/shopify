require 'test_helper'

class ShopifyproductsControllerTest < ActionController::TestCase
  setup do
    @shopifyproduct = shopifyproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopifyproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopifyproduct" do
    assert_difference('Shopifyproduct.count') do
      post :create, shopifyproduct: { producttitle: @shopifyproduct.producttitle }
    end

    assert_redirected_to shopifyproduct_path(assigns(:shopifyproduct))
  end

  test "should show shopifyproduct" do
    get :show, id: @shopifyproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopifyproduct
    assert_response :success
  end

  test "should update shopifyproduct" do
    put :update, id: @shopifyproduct, shopifyproduct: { producttitle: @shopifyproduct.producttitle }
    assert_redirected_to shopifyproduct_path(assigns(:shopifyproduct))
  end

  test "should destroy shopifyproduct" do
    assert_difference('Shopifyproduct.count', -1) do
      delete :destroy, id: @shopifyproduct
    end

    assert_redirected_to shopifyproducts_path
  end
end
