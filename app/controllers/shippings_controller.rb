class ShippingsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @shipping_purchase = ShippingPurchase.new
  end

  def create
    
    @item = Item.find(params[:item_id])
    @shipping_purchase = ShippingPurchase.new(shipping_params)
    if @shipping_purchase.valid?
      @shipping_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def shipping_params
      params.require(:shipping_purchase).permit(:postal_code, :prefecture_id, :municipality, :address,
                                                :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
    end
end
