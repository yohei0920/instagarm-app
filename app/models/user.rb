class User < ApplicationRecord
  ##関連
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, uniqueness: true

  ##メソッド
  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:passowrd_confirmation].blank?
      params.delete(:password)
      params.delete(:passowrd_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
