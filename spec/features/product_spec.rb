require 'rails_helper'

RSpec.feature 'Product management', :type => :feature do
  scenario 'User creates a new product' do
    visit '/products/new'

    fill_in 'Name', :with => 'Product One'
    click_button 'Create Product'

    expect(page).to have_text('Product was successfully created.')
    expect(page).to have_text('Product Product One')
    expect(page).to have_text('Name: Product One')
  end

  scenario 'Add variant' do
    product = FactoryGirl.create(:product)
    visit "/products/#{product.id}"

    fill_in 'variant_name', :with => 'Variant One'
    click_button 'Create Variant'

    expect(page).to have_text('Variant was successfully created.')
    expect(page).to have_text('Variant One Remove')
  end

  scenario 'Remove variant' do
    product = FactoryGirl.create(:product)
    FactoryGirl.create(:variant, product: product)
    visit "/products/#{product.id}"

    click_link 'Remove'

    expect(page).to have_text('Variant was successfully destroyed.')
    expect(page).to_not have_text('Variant One Remove')
  end
end