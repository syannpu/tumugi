class Target < ApplicationRecord
  has_many :marche_targets, dependent: :destroy
end
