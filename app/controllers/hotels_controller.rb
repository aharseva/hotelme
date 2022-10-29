class HotelsController < ApplicationController

  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.save
  end

  private

  def flat_params
    params.require(:hotel).permit(:name, :address, :description, :price, :occupancy)
  end
end
