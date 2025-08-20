class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
  has_many :marches, class_name: "Marche", dependent: :destroy
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true, on: :registration
  has_many :join_marches, dependent: :destroy
  has_many :joined_marches, through: :join_marches, source: :marche

  validates :hometown, presence: true, on: :registration
  validates :gender, presence: true, inclusion: { in: [ "男性", "女性", "その他" ] }, on: :registration
  validates :age, presence: true, numericality: { greater_than: 0, less_than: 150 },  on: :registration
  validates :instagram, format: { with: /\A@?[a-zA-Z0-9_.]+\z/ }, allow_blank: true,  on: :registration
  validates :shop_name, presence: true, length: { maximum: 50 }, on: :registration
  validates :products, presence: true, length: { maximum: 255 }, on: :registration
  validates :experience, presence: true, inclusion: { in: [ "初回", "2～5回", "6回以上" ] }, on: :registration
  validates :contact_info, presence: true, length: { maximum: 50 }, on: :registration
  validates :self_pr, presence: true, length: { maximum: 255 }, on: :registration
end
