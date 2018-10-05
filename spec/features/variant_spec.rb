require 'rails_helper'

RSpec.feature 'Product management', :type => :feature do
  scenario 'Display variant' do
    variant = FactoryGirl.create(:variant)

    visit "/variants/#{variant.id}"

    expect(page).to have_text('Variant: Product One - Variant One')
    expect(page).to have_text('Product: Product One')
    expect(page).to have_text('Name: Variant One')
  end
end