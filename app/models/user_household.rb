class UserHousehold < ApplicationRecord
  # before_save :gain_vetos

  belongs_to :user
  belongs_to :household
  validates :user, uniqueness: { scope: :household }

  # def gain_vetos
  #   if self.total_points == 5
  #     self.vetos_remaining += 1
  #   end
  # end
end
