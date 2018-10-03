# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  has_many :variants, dependent: :destroy

  validates_uniqueness_of :name
end
