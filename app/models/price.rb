class Price < ApplicationRecord
  has_many :marche_prices, dependent: :destroy
end
