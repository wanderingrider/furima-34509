class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :shipping_charge_id, :prefecture_id,
                                 :shipping_date_id, :product_status_id, :price, :image).merge(user_id: current_user.id)
  end
end
