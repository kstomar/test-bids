require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :auction => nil,
      :minimum_bid_value => "9.99"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[auction_id]"

      assert_select "input[name=?]", "item[minimum_bid_value]"
    end
  end
end
