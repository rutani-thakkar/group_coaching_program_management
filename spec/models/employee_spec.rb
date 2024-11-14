require 'rails_helper'

RSpec.describe Employee, type: :model do
  let!(:company) { create(:company) } # Create a company using FactoryBot

  # Associations
  it { should belong_to(:company) }
  it { should have_and_belong_to_many(:coaching_programs) }

  # Validations
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:email) }

    it 'validates format of email' do
      valid_emails = ['test@example.com', 'test.user@domain.co']
      valid_emails.each do |email|
        employee = build(:employee, email: email, company: company)
        expect(employee).to be_valid
      end

      invalid_emails = ['invalid_email', 'test@domain,com', '@domain.com']
      invalid_emails.each do |email|
        employee = build(:employee, email: email, company: company)
        expect(employee).not_to be_valid
      end
    end

    describe 'email uniqueness' do
      it 'ensures email is unique' do
        create(:employee, email: 'rutani.t@gmail.com', company: company)
        employee2 = build(:employee, email: 'rutani.t@gmail.com', company: company)

        expect(employee2).not_to be_valid
        expect(employee2.errors[:email]).to include('has already been taken')
      end
    end
  end
end
