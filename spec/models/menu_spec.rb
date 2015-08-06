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

  it "should require name" do
    @menu.title = nil
    @menu.should_not be_valid
  end

  describe "filter menu item by category_id is eq to menu item" do
    it "filer by category_id method Menu" do
      @menu = Menu.create(title: "Potatoes",description:"Very cool",price: "10", published_on: "2015-07-31",category_id: 2) 
      @menu.category_id.to_s
      expect(Menu.filter(2).last).to eq @menu
    end

    it "filer by category_id is not eq to menu item" do
      @menu = Menu.create(title: "Potatoes",description:"Very cool",price: "10", published_on: "2015-07-31",category_id: 3) 
      @menu.category_id.to_s
      expect(Menu.filter(2).last).not_to eq @menu
    end
  end

  describe "time ago method" do
    
    it "is eq to menu item" do
      @menu = Menu.create(title: "Potatoes",description:"Very cool",price: "10", published_on: "2015-07-31",created_at: 2.days.ago) 
      expect(Menu.time_ago('2').last).to eq @menu
    end

    it "is not eq to menu item" do
      @menu = Menu.create(title: "Potatoes",description:"Very cool",price: "10", published_on: "2015-07-31",created_at: 5.days.ago) 
      expect(Menu.time_ago('2').last).not_to eq @menu
    end

  end


end
