class PriceTiersController < ApplicationController

  skip_before_action :authorize_request, only: :index

  def index
    @price_tiers = PriceTier.all
    render json: @price_tiers
  end

end
