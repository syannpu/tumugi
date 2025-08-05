class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
  has_many :marches, class_name: "Marche", dependent: :destroy
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :hometown, presence: true
  validates :gender, presence: true, inclusion: { in: ['男性', '女性', 'その他'] }
  validates :age, presence: true, numericality: { greater_than: 0, less_than: 150 }
  validates :instagram, format: { with: /\A@?[a-zA-Z0-9_.]+\z/ }, allow_blank: true
end
