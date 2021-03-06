# == Schema Information
#
# Table name: deeds
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Deed < ApplicationRecord
  has_many :items

  validates_uniqueness_of :name
  validates_presence_of :name
end
