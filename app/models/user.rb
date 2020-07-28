class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :item_purchases

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }

    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/
    validates :password, format: { with: VALID_PASSWORD_REGEX }, confirmation: true

    VALID_NAME_REGEX =/\A[ぁ-んァ-ン一-龥]/
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :last_name, format: { with: VALID_NAME_REGEX }

    VALID_KANA_REGEX =/\A[ァ-ヶー－]+\z/
    validates :first_kana, format: { with: VALID_KANA_REGEX }
    validates :last_kana, format: { with: VALID_KANA_REGEX }

    validates :birth_date
  end
end
