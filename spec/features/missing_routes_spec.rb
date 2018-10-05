require 'rails_helper'

RSpec.feature 'Missing route', :type => :feature do
  scenario 'Missing routes redirects to root' do
    FactoryGirl.create(:product)

    visit '/items'

    expect(page).to have_text('Product One Show Edit Destroy')
  end
end