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

  describe "total price order's price" do

    it "is eq to 30" do
      order1 = Order.create!(name: "Slava",address:"Ternoliska st.11",price: "10.00", email: "fender707@rambler.ru") 
      order2 = Order.create!(name: "Vitalya",address:"Ternoliska st.11",price: "20.00", email: "fender709@rambler.ru") 
      expect(Order.total_price).to eq 30
    end

    it "is not eq 30" do
      order1 = Order.create!(name: "Slava",address:"Ternoliska st.11",price: "20.00", email: "fender707@rambler.ru") 
      order2 = Order.create!(name: "Vitalya",address:"Ternoliska st.11",price: "20.00", email: "fender709@rambler.ru") 
      expect(Order.total_price).not_to eq 30
    end

  end

end
