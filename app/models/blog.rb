class Blog < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users,through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  belongs_to :user

  def created_by?(input_user)
    return false unless input_user
    user_id == input_user.id
  end
end
