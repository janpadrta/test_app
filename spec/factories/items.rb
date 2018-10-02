# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  deed_id    :integer
#  variant_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :item do
    deed
    variant
  end
end
