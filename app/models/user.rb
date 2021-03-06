class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_households, dependent: :destroy
  has_many :households, through: :user_households, dependent: :destroy
  has_many :messages
  has_one :household
end
