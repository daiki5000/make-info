class Info < ApplicationRecord
  belongs_to :user
  
  has_many :favorite, dependent: :destroy
  has_many :fav_user, through: :favorite, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
end
