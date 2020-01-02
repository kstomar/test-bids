require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :auction => nil,
      :minimum_bid_value => "9.99"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[auction_id]"

      assert_select "input[name=?]", "item[minimum_bid_value]"
    end
  end
end
