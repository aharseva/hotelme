class BookingsController < ApplicationController

    def index
        @bookings = Booking.where(user_id: current_user)
        @hotels = Hotel.where(user_id: current_user)
    end 

    def show
      @booking = Booking.find(params[:id])
  
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.hotel = Hotel.find(params[:hotel_id])
        @booking.user = current_user
        @booking.save!
        if @booking.save
          redirect_to booking_path(@booking)
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
        params.require(:booking).permit(:start_date, :end_date, :status, :occupancy)
      end
end
