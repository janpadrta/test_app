require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  it 'should renders the index template' do
    get :index
    expect(response).to render_template('index')
  end

  it 'should get show' do
    product = FactoryGirl.create(:product)
    get :show, params: { id: product.id }
    assert_response :success
  end

  it 'should get new' do
    get :new
    assert_response :success
  end

  it 'should get edit' do
    product = FactoryGirl.create(:product)
    get :edit, params: { id: product.id }
    assert_response :success
  end

  it 'should create product' do
    assert_difference('Product.count') do
      post :create, params: { product: { name: 'Test' } }
    end

    assert_redirected_to product_url(Product.last)
  end

  it 'should destroy product' do
    product = FactoryGirl.create(:product)
    assert_difference('Product.count', -1) do
      delete :destroy, params: { id: product.id }
    end

    assert_redirected_to products_url
  end
end
