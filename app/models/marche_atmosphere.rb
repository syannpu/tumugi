class MarcheAtmosphere < ApplicationRecord
  belongs_to :marche
  belongs_to :atmosphere

  validates :marche_id, uniqueness: { scope: :atmosphere_id }
end
