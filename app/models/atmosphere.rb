class Atmosphere < ApplicationRecord
  has_many :marche_atmospheres, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "created_at", "updated_at" ]
  end
end
