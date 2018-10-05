require 'rails_helper'

RSpec.feature 'Deed management', :type => :feature do
  scenario 'User creates a new deed' do
    visit '/deeds/new'

    fill_in 'Name', :with => 'Deed One'
    click_button 'Create Deed'

    expect(page).to have_text('Deed was successfully created.')
    expect(page).to have_text('Deed Deed One')
    expect(page).to have_text('Deed name: Deed One')
  end

  scenario 'Missing variant' do
    deed = FactoryGirl.create(:deed)
    visit "/deeds/#{deed.id}"

    fill_in 'item_name', :with => 'Item One'
    click_button 'Create Item'

    expect(page).to have_text('Variant must exist')
  end

  scenario 'Add item' do
    deed = FactoryGirl.create(:deed)
    FactoryGirl.create(:variant, name: 'Variant One')
    expect(Item.count).to eq(0)

    visit "/deeds/#{deed.id}"
    fill_in 'item_name', :with => 'Item One'
    click_button 'Create Item'

    expect(Item.count).to eq(1)
    expect(page).to have_text('Item was successfully created.')
    expect(page).to have_text('Item One Product One - Variant One Remove')
  end

  scenario 'Add two items' do
    deed = FactoryGirl.create(:deed)
    product = FactoryGirl.create(:product, name: 'Product One')
    FactoryGirl.create(:variant, product: product, name: 'Variant One')
    product = FactoryGirl.create(:product, name: 'Product Two')
    FactoryGirl.create(:variant, product: product, name: 'Variant Two')

    expect(Item.count).to eq(0)

    visit "/deeds/#{deed.id}"
    fill_in 'item_name', :with => 'Item One'
    select "Product One - Variant One", :from => "item_variant_id"
    click_button 'Create Item'

    expect(Item.count).to eq(1)

    fill_in 'item_name', :with => 'Item Two'
    select "Product Two - Variant Two", :from => "item_variant_id"
    click_button 'Create Item'

    expect(Item.count).to eq(2)
    expect(page).to have_text('Item One Product One - Variant One Remove')
    expect(page).to have_text('Item Two Product Two - Variant Two Remove')
  end

  scenario 'Remove variant' do
    deed = FactoryGirl.create(:deed)
    variant = FactoryGirl.create(:variant)
    FactoryGirl.create(:item, deed: deed, variant: variant)
    expect(Item.count).to eq(1)

    visit "/deeds/#{deed.id}"
    click_link 'Remove'

    expect(Item.count).to eq(0)
    expect(page).to have_text('Item was successfully destroyed.')
    expect(page).to_not have_text('Item One - Variant One Remove')
  end

  scenario 'Link to variant' do
    deed = FactoryGirl.create(:deed)
    variant = FactoryGirl.create(:variant)
    FactoryGirl.create(:item, deed: deed, variant: variant, name: 'Item One')

    visit "/deeds/#{deed.id}"
    click_link('Product One - Variant One')

    expect(page).to have_text('Product Product One')
    expect(page).to have_text('Variant One Remove')
  end

  scenario 'Link to item' do
    deed = FactoryGirl.create(:deed)
    variant = FactoryGirl.create(:variant)
    FactoryGirl.create(:item, deed: deed, variant: variant, name: 'Item One')

    visit "/deeds/#{deed.id}"
    click_link('Item One')

    expect(page).to have_text('Product: Product One')
    expect(page).to have_text('Name: Variant One')
  end

  scenario 'Name taken' do
    deed = FactoryGirl.create(:deed)
    FactoryGirl.create(:variant)
    expect(Item.count).to eq(0)

    visit "/deeds/#{deed.id}"
    fill_in 'item_name', :with => 'Item One'
    click_button 'Create Item'
    expect(Item.count).to eq(1)
    fill_in 'item_name', :with => 'Item One'
    click_button 'Create Item'

    expect(Item.count).to eq(1)
    expect(page).to have_text('Name has already been taken')
  end
end