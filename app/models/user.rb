class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates  :nickname, presence: true     

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
   validates :surname   
   validates :first_name
   validates :read_surname
   validates :read_first_name
end

PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX

validates :birthday,        presence: true
end
