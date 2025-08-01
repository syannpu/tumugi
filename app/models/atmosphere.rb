class Atmosphere < ApplicationRecord
  has_many :marche_atmospheres, dependent: :destroy
end
