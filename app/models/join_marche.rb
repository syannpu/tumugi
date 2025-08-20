class JoinMarche < ApplicationRecord
  belongs_to :marche
  belongs_to :user

  validates :marche_id, uniqueness: { scope: :user_id }
  enum approval_status: { pending: 0, approved: 1, rejected: 2 }

  validate :cannot_apply_to_own_marche

  def approval_status_display
    case approval_status
    when "pending"
      "選定中"
    when "approved"
      "確定"
    when "rejected"
      "お断り"
    end
  end

  private

  def cannot_apply_to_own_marche
    if marche&.user == user
      errors.add(:base, "自分が開催するマルシェには出品申請できません")
    end
  end
end
