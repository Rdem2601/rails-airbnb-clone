class UsersController < ApplicationController

  def show
    @user = current_user
    @bookings = Booking.where(params[@user.id])
  end
end
