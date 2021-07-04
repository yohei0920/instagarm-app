class Comment < ApplicationRecord
  #関連
  belongs_to :user
  belongs_to :post
end
