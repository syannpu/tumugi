class Marche < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :location, presence: true, length: { maximum: 255 }

  belongs_to :user
  mount_uploaders :images, ImageUploader
  mount_uploader :layout_image, LayoutImageUploader
  has_many :marche_atmospheres, dependent: :destroy
  has_many :atmospheres, through: :marche_atmospheres, source: :atmosphere
  has_many :marche_targets, dependent: :destroy
  has_many :targets, through: :marche_targets, source: :target
  has_many :marche_prices, dependent: :destroy
  has_many :prices, through: :marche_prices, source: :price
  has_many :join_marches
  has_many :bookmarks, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "body", "created_at", "end_at", "id", "location", "start_at", "title", "updated_at", "user_id", "held_at" ]
  end

  # 関連付けも検索対象にする場合
  def self.ransackable_associations(auth_object = nil)
    [ "atmospheres", "targets", "prices" ]  # 必要に応じて追加
  end
end
