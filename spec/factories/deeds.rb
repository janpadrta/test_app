# == Schema Information
#
# Table name: deeds
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :deed do
    name 'Deed One'
  end
end
