class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: :create

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.item = Item.find(params[:item_id])
    if @review.save
      respond_to do |format|
        format.html { redirect_to item_path(@item) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'items/show' }
        format.js
      end
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @review =  Review.find(params[:id])
    @review.destroy
    redirect_to item_path(@item)
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end
end
