class Company < ApplicationRecord
  has_many :coaching_programs
  has_many :employees
  has_many :coaches, through: :coaching_programs

  # Validations
  validates :name, presence: true
end
