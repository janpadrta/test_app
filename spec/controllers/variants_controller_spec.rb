require 'rails_helper'

RSpec.describe VariantsController, type: :controller do
  it "should renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should get edit" do
    variant = FactoryGirl.create(:variant)
    get :edit, params: { id: variant.id }
    assert_response :success
  end

  it "should create variant" do
    product = FactoryGirl.create(:product)
    assert_difference('Variant.count') do
      post :create, params: { variant: { name: 'Test', product_id: product.id } }
    end

    assert_redirected_to product_url(Variant.last.product)
  end

  it "should destroy variant" do
    variant = FactoryGirl.create(:variant)
    product = variant.product
    assert_difference('Variant.count', -1) do
      delete :destroy, params: { id: variant.id }
    end

    assert_redirected_to product_url(product)
  end
end
