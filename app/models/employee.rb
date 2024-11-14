class Employee < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :coaching_programs

  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :position, presence: true
  validates :email, presence: true,
  uniqueness: true,
  format: { with: VALID_EMAIL_REGEX }

end
