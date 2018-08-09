class BookingsController < ApplicationController
before_action :find_chill

  def new
      @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.chill = @chill
    @booking.user = current_user
    @booking.save!
  end



private

def booking_params
  params.require(:booking).permit(:date)
end

def find_chill
  @chill = Chill.find(params[:chill_id])
end



end
