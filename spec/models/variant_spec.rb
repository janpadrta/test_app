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
  pending "add some examples to (or delete) #{__FILE__}"
end