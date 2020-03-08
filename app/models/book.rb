class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites
	has_many :post_comments

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def post_commented_by?(user)
        post_comments.where(user_id: user.id).exists?
	end

	def self.search(search)
		if search
			Book.where(['title LIKE ?', "%#{search}%"])
		  else
			Book.all
		  end
	  end
end
