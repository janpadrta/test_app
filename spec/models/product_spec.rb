# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:variants) }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of  :name }
end
