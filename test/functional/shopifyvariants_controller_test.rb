require 'test_helper'

class ShopifyvariantsControllerTest < ActionController::TestCase
  setup do
    @shopifyvariant = shopifyvariants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopifyvariants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopifyvariant" do
    assert_difference('Shopifyvariant.count') do
      post :create, shopifyvariant: { integer: @shopifyvariant.integer, integer: @shopifyvariant.integer, integer: @shopifyvariant.integer, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, variantgrams: @shopifyvariant.variantgrams, variantid: @shopifyvariant.variantid, variantinvqty: @shopifyvariant.variantinvqty, variantop1: @shopifyvariant.variantop1, variantop2: @shopifyvariant.variantop2, variantposition: @shopifyvariant.variantposition, variantprice: @shopifyvariant.variantprice, variantsku: @shopifyvariant.variantsku, varianttitle: @shopifyvariant.varianttitle }
    end

    assert_redirected_to shopifyvariant_path(assigns(:shopifyvariant))
  end

  test "should show shopifyvariant" do
    get :show, id: @shopifyvariant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopifyvariant
    assert_response :success
  end

  test "should update shopifyvariant" do
    put :update, id: @shopifyvariant, shopifyvariant: { integer: @shopifyvariant.integer, integer: @shopifyvariant.integer, integer: @shopifyvariant.integer, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, string: @shopifyvariant.string, variantgrams: @shopifyvariant.variantgrams, variantid: @shopifyvariant.variantid, variantinvqty: @shopifyvariant.variantinvqty, variantop1: @shopifyvariant.variantop1, variantop2: @shopifyvariant.variantop2, variantposition: @shopifyvariant.variantposition, variantprice: @shopifyvariant.variantprice, variantsku: @shopifyvariant.variantsku, varianttitle: @shopifyvariant.varianttitle }
    assert_redirected_to shopifyvariant_path(assigns(:shopifyvariant))
  end

  test "should destroy shopifyvariant" do
    assert_difference('Shopifyvariant.count', -1) do
      delete :destroy, id: @shopifyvariant
    end

    assert_redirected_to shopifyvariants_path
  end
end
