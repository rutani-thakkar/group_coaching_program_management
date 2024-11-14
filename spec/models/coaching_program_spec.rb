require 'rails_helper'

RSpec.describe CoachingProgram, type: :model do
  # Associations
  it { should belong_to(:company) }
  it { should have_and_belong_to_many(:coaches) }
  it { should have_and_belong_to_many(:employees) }

  # Validations
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
