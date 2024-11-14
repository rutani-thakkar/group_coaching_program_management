class CoachingProgram < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :coaches
  has_and_belongs_to_many :employees

  # Validations
  validates :name, presence: true
end
