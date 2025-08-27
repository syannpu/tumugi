class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :marche

  validates :user_id, uniqueness: { scope: :marche_id }
end
