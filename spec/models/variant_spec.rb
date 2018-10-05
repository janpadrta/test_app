# == Schema Information
#
# Table name: variants
#
#  id         :integer          not null, primary key
#  name       :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Variant, type: :model do
  it { should have_many(:items) }
  it { should belong_to(:product) }
  it { should validate_presence_of  :name }

  context 'instance methods' do
    it 'should return correct value of name_with_detail' do
      product = FactoryGirl.create(:product, name: 'Product One')
      variant = FactoryGirl.create(:variant, product: product, name: 'Variant One')

      expect(variant.name_with_detail).to eq('Product One - Variant One')
    end

    it 'should return correct value of product_name' do
      product = FactoryGirl.create(:product, name: 'Product One')
      variant = FactoryGirl.create(:variant, product: product, name: 'Variant One')

      expect(variant.product_name).to eq('Product One')
    end
  end
end
