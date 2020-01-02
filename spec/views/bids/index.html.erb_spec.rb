require 'rails_helper'

RSpec.describe "bids/index", type: :view do
  before(:each) do
    assign(:bids, [
      Bid.create!(
        :item => nil,
        :value => "9.99",
        :user => nil
      ),
      Bid.create!(
        :item => nil,
        :value => "9.99",
        :user => nil
      )
    ])
  end

  it "renders a list of bids" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
