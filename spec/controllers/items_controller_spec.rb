require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  it "should renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should get edit" do
    item = FactoryGirl.create(:item)
    get :edit, params: { id: item.id }
    assert_response :success
  end

  it "should create item" do
    deed = FactoryGirl.create(:deed)
    variant = FactoryGirl.create(:variant)
    assert_difference('Item.count') do
      post :create, params: { item: { name: 'Test', deed_id: deed.id, variant_id: variant.id } }
    end

    assert_redirected_to deed_url(deed)
  end

  it "should destroy item" do
    item = FactoryGirl.create(:item)
    deed = item.deed
    assert_difference('Item.count', -1) do
      delete :destroy, params: { id: item.id }
    end

    assert_redirected_to deed_url(deed)
  end
end