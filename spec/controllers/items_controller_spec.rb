require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  it 'should not renders index' do
    expect { get :index }.to raise_error(ActionController::UrlGenerationError)
  end

  it 'should get new' do
    expect { get :new }.to raise_error(ActionController::UrlGenerationError)
  end

  it 'should get edit' do
    item = FactoryGirl.create(:item)
    expect { get :edit, params: { id: item.id } }.to raise_error(ActionController::UrlGenerationError)
  end

  it 'should create item' do
    deed = FactoryGirl.create(:deed)
    variant = FactoryGirl.create(:variant)
    assert_difference('Item.count') do
      post :create, params: { item: { name: 'Test', deed_id: deed.id, variant_id: variant.id } }
    end

    assert_redirected_to deed_url(deed)
  end

  it 'should destroy item' do
    item = FactoryGirl.create(:item)
    deed = item.deed
    assert_difference('Item.count', -1) do
      delete :destroy, params: { id: item.id }
    end

    assert_redirected_to deed_url(deed)
  end
end
