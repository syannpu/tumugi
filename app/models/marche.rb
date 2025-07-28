class Marche < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :location, presence: true, length: { maximum: 255 }
  
  belongs_to :user
end
