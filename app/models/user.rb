class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog
  has_many :blogs

  validates :name,presence:true,length:{ maximum:40 }
  validates :email,presence:true,length:{ maximum:300 },
                  format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness:true

  before_save{ email.downcase! }
  has_secure_password
  validates :password,presence:true,length:{ minimum:6 }

end
