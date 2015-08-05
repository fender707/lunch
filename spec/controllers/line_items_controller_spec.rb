require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  context "when user logged in" do

    let(:user) { FactoryGirl.create(:user)}

      before do
        sign_in user
      end

    describe "Post #create" do
      it "should create line_item" do
        @line_item = FactoryGirl.create :line_item
        assert_difference('LineItem.count') do
          post :create, menu_id:  @line_item.id
        end
        assert_redirected_to root_path
      end
    end
  end
end
