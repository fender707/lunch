require 'rails_helper'

RSpec.describe LineItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should belong_to(:menu) }

  it { should belong_to(:cart) }

  it { should belong_to(:order) }

end
