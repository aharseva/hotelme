class BookingsController < ApplicationController

    def index
        @bookings = Booking.where(user_id: current_user)
        @hotels = Hotel.where(user_id: current_user)
    end 

    def create
        @booking = Booking.new(booking_params)
        @hotel = Hotel.find(params[:hotel_id])
        @booking.hotel = @hotel
        @booking.user = current_user
        if @booking.save!
          redirect_to hotel_bookings_url
        else
          render 'hotels/show', status: :unprocessable_entity
        end
    end 

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        redirect_to hotel_path(@booking.hotel)
      end

    private

    def booking_params
        params.require(:booking).permit(:start_date, :end_date, :status)
      end
end
