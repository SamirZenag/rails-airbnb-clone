class ReviewsController < ApplicationController

  def create

    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to dashboard_listings_path
      authorize(@review)
    else
      render dashboard_listings_path
    end
  end

  private
   def review_params
    params.require(:review).permit(:content)
  end
end
