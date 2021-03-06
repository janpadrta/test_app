# == Schema Information
#
# Table name: deeds
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Deed, type: :model do
  it { should have_many(:items) }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of  :name }
end
