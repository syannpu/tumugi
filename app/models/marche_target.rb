class MarcheTarget < ApplicationRecord
  belongs_to :marche
  belongs_to :target

  validates :marche_id, uniqueness: { scope: :target_id }
end
