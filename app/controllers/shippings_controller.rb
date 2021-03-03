class ShippingsController < ApplicationController

  def index
  end

  def new
    @shipping_purchase = ShippingPurchase.new
  end

  def create
    @shipping_purchase = ShippingPurchase.new(shipping_params)
    if @shipping_purchase.valid?
      @shipping_purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def shipping_params
      params.require(:shipping_params).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user.id: current_user.id)
    end
end
