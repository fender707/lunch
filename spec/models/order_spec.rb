require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should have_many(:line_items) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:address) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:price) }

  it { should validate_length_of(:name).is_at_least(3) }

  it { should validate_length_of(:name).is_at_most(50) }

  it { should validate_length_of(:address).is_at_least(10) }

  it { should validate_length_of(:address).is_at_most(50) }

end
