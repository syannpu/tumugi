class MarchePrice < ApplicationRecord
  belongs_to :marche
  belongs_to :price

  validates :marche_id, uniqueness: { scope: :price_id }
end
