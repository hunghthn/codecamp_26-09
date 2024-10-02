# app/channels/reviews_channel.rb
class ReviewsChannel < ApplicationCable::Channel
  def subscribed
    stream_for Book.find(params[:book_id])
  end

  def unsubscribed
  end
end
