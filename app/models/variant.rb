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

class Variant < ApplicationRecord
  belongs_to :product
  has_many :items, dependent: :destroy

  validates_uniqueness_of :name, scope: :product_id
  validates_presence_of :name

  def name_with_detail
    "#{product_name} - #{name}"
  end

  def product_name
    product.name
  end
end
