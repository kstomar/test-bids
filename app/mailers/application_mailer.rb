class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def higher_bid_failed(user, item, auction)
    @user = user
    mail(to: user.email,
        body: "A bid higher than your bid is placed on the item #{item.name} for auction #{auction.name}",
        content_type: "text/html",
        subject: "You are loosing!")
  end

  def notify_winner(auction)
    auction.items.each do |item|
      highest_bid_value = item.bids.order("value DESC").first
      mail(to: highest_bid_value.user.email,
        body: "You won the bid that you placed on the item #{item.name} for auction #{auction.name}",
        content_type: "text/html",
        subject: "You won!!!")
    end
  end

end
