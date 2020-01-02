class Auction < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :bids, through: :items
  accepts_nested_attributes_for :items, allow_destroy: true
  after_create :notify_winner

  def notify_winner
    ApplicationMailer.notify_winner(self).deliver_at(end_time)
  end
end
