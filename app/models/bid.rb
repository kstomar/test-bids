class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :user, optional: true

  after_create :notify_user_about_higher_bid

  def notify_user_about_higher_bid
    highest_bid_value = item.bids.order("value DESC").first
    unless highest_bid_value.user != user
      ApplicationMailer.higher_bid_failed(user, item, item.auction).deliver_now
    end
  end

end
