require 'rails_helper'

RSpec.describe Menu, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before(:each) { @menu = FactoryGirl.create :menu}
  it { should belong_to(:category) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:published_on) }

  it { should validate_presence_of(:price) }

  it { should ensure_length_of(:title).is_at_least(3) }

  it { should validate_uniqueness_of(:title) }

  it { should ensure_length_of(:title).is_at_most(50) }

  it { should ensure_length_of(:description).is_at_most(500) }

end
