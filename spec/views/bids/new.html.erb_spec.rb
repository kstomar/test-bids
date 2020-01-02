require 'rails_helper'

RSpec.describe "bids/new", type: :view do
  before(:each) do
    assign(:bid, Bid.new(
      :item => nil,
      :value => "9.99",
      :user => nil
    ))
  end

  it "renders new bid form" do
    render

    assert_select "form[action=?][method=?]", bids_path, "post" do

      assert_select "input[name=?]", "bid[item_id]"

      assert_select "input[name=?]", "bid[value]"

      assert_select "input[name=?]", "bid[user_id]"
    end
  end
end
