class Household < ApplicationRecord
  belongs_to :user
  has_many :user_households, dependent: :destroy
  has_many :users, through: :user_households, dependent: :destroy
  has_many :household_movies, dependent: :destroy
  has_many :movies, through: :household_movies, dependent: :destroy
  has_many :randomize_options, through: :household_movies, dependent: :destroy
  # PROBLEM SEEDING IF UNCOMMENTED BELOW?? CHECK
  # validates :name, uniqueness: true
end
