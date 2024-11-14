class Coach < ApplicationRecord
  has_and_belongs_to_many :coaching_programs

  # Validations
  validates :name, presence: true
end
