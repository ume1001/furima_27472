class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :item_purchases

  with_options presence: true do
    validates :nickname, uniqueness: true

    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

    # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/ }, confirmation: true

    # VALID_NAME_REGEX =/\A[ぁ-んァ-ン一-龥]/
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

    # VALID_KANA_REGEX =/\A[ァ-ヶー－]+\z/
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birth_date
  end
end
