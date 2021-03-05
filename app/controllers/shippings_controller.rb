class ShippingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_shippings, only: [:index, :create]

  def index
    return redirect_to root_path if @item.user.id == current_user.id && Shipping.select(:user_id)

    @shipping_purchase = ShippingPurchase.new
  end

  def create
    @shipping_purchase = ShippingPurchase.new(shipping_params)
    if @shipping_purchase.valid?
      pay_item
      @shipping_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_params
    params.require(:shipping_purchase).permit(:postal_code, :prefecture_id, :municipality, :address,
                                              :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: shipping_params[:token],
      currency: 'jpy'
    )
  end

  def set_shippings
    @item = Item.find(params[:item_id])
  end
end
