class Item < ApplicationRecord
  belongs_to :auction
  has_many :bids, dependent: :destroy
end
