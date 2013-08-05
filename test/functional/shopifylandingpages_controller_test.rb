require 'test_helper'

class ShopifylandingpagesControllerTest < ActionController::TestCase
  setup do
    @shopifylandingpage = shopifylandingpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopifylandingpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopifylandingpage" do
    assert_difference('Shopifylandingpage.count') do
      post :create, shopifylandingpage: { integer: @shopifylandingpage.integer, producthandle: @shopifylandingpage.producthandle, productid: @shopifylandingpage.productid, productimage1: @shopifylandingpage.productimage1, productimage2: @shopifylandingpage.productimage2, productimage3: @shopifylandingpage.productimage3, producttitle: @shopifylandingpage.producttitle, producttype: @shopifylandingpage.producttype, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string }
    end

    assert_redirected_to shopifylandingpage_path(assigns(:shopifylandingpage))
  end

  test "should show shopifylandingpage" do
    get :show, id: @shopifylandingpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopifylandingpage
    assert_response :success
  end

  test "should update shopifylandingpage" do
    put :update, id: @shopifylandingpage, shopifylandingpage: { integer: @shopifylandingpage.integer, producthandle: @shopifylandingpage.producthandle, productid: @shopifylandingpage.productid, productimage1: @shopifylandingpage.productimage1, productimage2: @shopifylandingpage.productimage2, productimage3: @shopifylandingpage.productimage3, producttitle: @shopifylandingpage.producttitle, producttype: @shopifylandingpage.producttype, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string, string: @shopifylandingpage.string }
    assert_redirected_to shopifylandingpage_path(assigns(:shopifylandingpage))
  end

  test "should destroy shopifylandingpage" do
    assert_difference('Shopifylandingpage.count', -1) do
      delete :destroy, id: @shopifylandingpage
    end

    assert_redirected_to shopifylandingpages_path
  end
end
