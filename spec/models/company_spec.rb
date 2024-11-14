require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should have_many(:coaching_programs) }
    it { should have_many(:employees) }
    it { should have_many(:coaches).through(:coaching_programs) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
