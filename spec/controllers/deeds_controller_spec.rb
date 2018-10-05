require 'rails_helper'

RSpec.describe DeedsController, type: :controller do
  it 'should renders the index template' do
    get :index
    expect(response).to render_template('index')
  end

  it 'should get show' do
    deed = FactoryGirl.create(:deed)
    get :show, params: { id: deed.id }
    assert_response :success
  end

  it 'should get new' do
    get :new
    assert_response :success
  end

  it 'should get edit' do
    deed = FactoryGirl.create(:deed)
    get :edit, params: { id: deed.id }
    assert_response :success
  end

  it 'should create deed' do
    assert_difference('Deed.count') do
      post :create, params: { deed: { name: 'Test' } }
    end

    assert_redirected_to deed_url(Deed.last)
  end

  it 'should destroy deed' do
    deed = FactoryGirl.create(:deed)
    assert_difference('Deed.count', -1) do
      delete :destroy, params: { id: deed.id }
    end

    assert_redirected_to deeds_url
  end
end
