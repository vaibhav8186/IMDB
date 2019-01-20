class Actor < ApplicationRecord
  has_and_belongs_to_many :movies
  validates :name, presence: true
  validates :actor_dob, presence: true
  validates :description, presence:true
end
