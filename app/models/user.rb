class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :item_purchases

  validates :nickname, presence: true

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/ }, confirmation: true

  # VALID_NAME_REGEX =/\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  # VALID_KANA_REGEX =/\A[ァ-ヶー－]+\z/
  validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :birth_date, presence: true
end
