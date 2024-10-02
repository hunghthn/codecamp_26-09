# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)

    if @review.save
      ReviewsChannel.broadcast_to(@book, @review)
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
