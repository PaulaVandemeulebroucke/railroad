class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:home, :offers]

  def home
    @offers = Offer.all
    @offer = Offer.new
  end
end
