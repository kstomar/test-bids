require 'rails_helper'

RSpec.describe "bids/show", type: :view do
  before(:each) do
    @bid = assign(:bid, Bid.create!(
      :item => nil,
      :value => "9.99",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
