class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @item = Item.find(params[:item_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = Item.find(params[:item_id])
    @booking.date = DateTime.now.to_date
    if @booking.save
      redirect_to item_booking_path(@booking.item, @booking)
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:number_of_days)
  end
end
