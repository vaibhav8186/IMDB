class Movie < ApplicationRecord
	has_and_belongs_to_many :actors
	validates :name, presence: true
  validates :description, presence: true
  validates :release, presence: true
  validates :rating, presence: true
end
