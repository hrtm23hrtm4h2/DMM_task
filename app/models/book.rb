class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	#引数で渡されたuser_idがFavoritesテーブル内に存在（exists?）するか　存在してればtrue,してなければfalse
	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
