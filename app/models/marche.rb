class Marche < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :location, presence: true, length: { maximum: 255 }

  belongs_to :user
  mount_uploaders :images, ImageUploader  
  has_many :marche_atmospheres, dependent: :destroy 
  has_many :atmospheres, through: :marche_atmospheres, source: :atmosphere
end
