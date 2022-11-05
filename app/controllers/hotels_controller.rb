class HotelsController < ApplicationController

  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @booking = Booking.new(hotel: @hotel)
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.save
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end
  
  def update
    @hotel = Hotel.find(params[:id])
    @hotel.update(hotel_params)
    redirect_to hotel_path(@hotel)
  end
  
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_path, status: :see_other
  end
  
  private

  def flat_params
    params.require(:hotel).permit(:name, :address, :description, :price, :occupancy)
  end
end
