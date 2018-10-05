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

FactoryGirl.define do
  factory :variant do
    name 'Variant One'
    product
  end
end
