class Photo < ApplicationRecord

  ##関連
  belongs_to :post

  ##バリデーション
  validates :image, presence: true

  ##アップローダー
  mount_uploader :image, ImageUploader
end
