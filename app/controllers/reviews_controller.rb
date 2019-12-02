class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.truck_id = params[:truck_id]
    @review.user = current_user
    @review.save
    redirect_to truck_path(params[:truck_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :truck_id, :user_id)
  end
end
