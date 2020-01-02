require 'rails_helper'

RSpec.describe "bids/edit", type: :view do
  before(:each) do
    @bid = assign(:bid, Bid.create!(
      :item => nil,
      :value => "9.99",
      :user => nil
    ))
  end

  it "renders the edit bid form" do
    render

    assert_select "form[action=?][method=?]", bid_path(@bid), "post" do

      assert_select "input[name=?]", "bid[item_id]"

      assert_select "input[name=?]", "bid[value]"

      assert_select "input[name=?]", "bid[user_id]"
    end
  end
end
