class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(user_id: @user.id)
    @items = Item.where(user_id: @user.id)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      Usermailer.creation_confirmation
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo, :photo_cache)
  end
end
