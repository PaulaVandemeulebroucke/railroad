class BookingsController < ApplicationController
  before_action :set_booking, only: [:create, :show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = Offer.find(params[:offer_id])
    if @booking.save
      redirect_to offer_path(@booking.offer)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking = Booking.new(booking_params)
    @booking.update
  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @booking.destroy
    redirect_to offer_path(@offer)
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
