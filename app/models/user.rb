class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :surname
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :read_surname
    validates :read_first_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :items
end
