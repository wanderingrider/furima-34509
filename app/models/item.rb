class Item < ApplicationRecord
  validates :product_name,       presence: true
  validates :description,        presence: true
  validates :category_id,        numericality: { other_than: 1 } 
  validates :Product_status_id,  numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :prefecture_id,      numericality: { other_than: 1 } 
  validates :shipping_date_id,   numericality: { other_than: 1 } 
  validates :price,              presence: true
  
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Product_status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

end
