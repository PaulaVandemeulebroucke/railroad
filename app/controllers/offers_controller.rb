class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        offers.company_name ILIKE :query \
        OR offers.description ILIKE :query \
        OR offers.address ILIKE :query \
      "
      @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
      clean_map
    else
      @offers = Offer.all
      clean_map
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
    authorize @offer
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to offers_path
  end

  def like
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.liked_by current_user
    redirect_to offers_path
  end

  def dislike
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.disliked_by current_user
    redirect_to offers_path
  end

private

  def offer_params
    params.require(:offer).permit(:company_name, :address, :description, :price, :photo)
  end

  def clean_map
    @offers = @offers.where.not(latitude: nil, longitude: nil)

    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
      infoWindow: { content: render_to_string(partial: "/offers/map_box", locals: { offer: offer }) }
      }
    end
  end
end
