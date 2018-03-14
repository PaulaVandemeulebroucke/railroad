class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:home, :offers]

   def dashboard
     @bookings= Booking.where(user_id: current_user.id)
   end

  def home
    @offers = Offer.all
    @offer = Offer.new
  end
end
