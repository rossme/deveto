class Message < ApplicationRecord
  belongs_to :chatroom, dependent: :destroy
  belongs_to :user
end
