class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books
  has_many :favorites
  has_many :favorite_books, through: :favorites, source: :book
  has_many :post_comments

  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction,
     length: { maximum: 50, message: 'is too long (maximum is 50 characters)' }

end
