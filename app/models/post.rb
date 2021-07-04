class Post < ApplicationRecord

  ##関連
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  #メソッド
  def liked_by(current_user)
    Like.find_by(user_id: current_user.id, post_id: id)
  end
end
