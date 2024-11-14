require 'rails_helper'

RSpec.describe Coach, type: :model do
  # Associations
  it { should have_and_belong_to_many(:coaching_programs) }

  # Validations
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
