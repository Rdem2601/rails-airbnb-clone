class BookingMailer < ApplicationMailer

  def creation_confirmation(booking)
    @booking = booking

    mail(
      to:       @booking.user.email,
      subject:  "#{@booking.user.fullname}, You bokking of #{@booking.item.name} is confirmed!"
    )
  end
end
