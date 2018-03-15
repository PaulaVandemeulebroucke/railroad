class BookingsController < ApplicationController

  def index
    @offer = Offer.find(params[:offer_id])
    authorize @offer, :destroy?
    @bookings = @offer.bookings
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.user = current_user #for sen an email

    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to offer_bookings_path(@booking.offer_id)
  end

  def deny
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to offer_bookings_path(@booking.offer_id)
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
      redirect_to dashboard_path
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

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :date, :status)
  end


end
