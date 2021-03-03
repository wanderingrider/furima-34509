class ShippingPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :shipping_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    shipping = Shipping.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, municipality: municipality, address: address,
                    building: building, phone_number: phone_number, prefecture_id: prefecture_id, shipping_id: shipping.id)
  end
end