class Shipping < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  belongs_to :item
end
