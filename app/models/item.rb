class Item < ApplicationRecord

  with_options presence: true do
    validates :product_name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 } do
   validates :category_id
   validates :product_status_id
   validates :shipping_charge_id
   validates :prefecture_id
   validates :shipping_date_id
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with:/\A[0-9]+\z/ }
  
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

end
