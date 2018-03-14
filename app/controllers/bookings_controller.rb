class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = Offer.find(params[:offer_id])
    authorize @booking
    @booking.user = current_user
    if @booking.save
      redirect_to offer_path(@booking.offer)
    else
      render :new
    end
  end

  # def show
  # end

  # def edit
  # end

  # def update
  #   @booking = Booking.new(booking_params)
  #   @booking.update
  # end

  # def destroy
  #   @offer = Offer.find(params[:offer_id])
  #   @booking.destroy
  #   redirect_to offer_path(@offer)
  # end

  private

  def booking_params
    params.require(:booking).permit(:description, :date, :status)
  end


end
