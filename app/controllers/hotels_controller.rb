class HotelsController < ApplicationController

  def index
    if params[:query].present?
      @hotels = Hotel.search_index(params[:query])
    else
      @hotels = Hotel.all
    end
    @markers = @hotels.geocoded.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude
      }
    end
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
    @hotel.user = current_user
    @hotel.save!
    if @hotel.save
      redirect_to hotel_path(@hotel)
    else
      render :new, status: :unprocessable_entity
    end
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

  def hotel_params
    params.require(:hotel).permit(:name, :address, :description, :price, :occupancy, :rating, photos: [])
  end
end
