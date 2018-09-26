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

class Item < ApplicationRecord
  belongs_to :deed
  belongs_to :variant
end
