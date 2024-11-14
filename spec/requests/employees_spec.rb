require 'rails_helper'

RSpec.describe 'Employees', type: :request do
  let(:company) { create(:company) }
  let(:coaching_program) { create(:coaching_program, company: company) }

  describe 'GET /companies/:company_id/employees/new' do
    it 'renders the new employee form successfully' do
      get new_company_employee_path(company)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /companies/:company_id/employees' do
    context 'with valid parameters' do
      it 'creates a new employee and assigns them to a coaching program' do
        valid_employee_params = attributes_for(:employee).merge({
          coaching_program_id: coaching_program.id
        })

        expect {
          post company_employees_path(company), params: { employee: valid_employee_params }
        }.to change(Employee, :count).by(1)

        new_employee = Employee.last
        expect(new_employee.coaching_programs).to include(coaching_program)
        expect(response).to redirect_to(company_path(company))
        follow_redirect!
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new employee and re-renders the new form' do
        invalid_employee_params = attributes_for(:employee, name: nil).merge({
          coaching_program_id: coaching_program.id
        })

        expect {
          post company_employees_path(company), params: { employee: invalid_employee_params }
        }.not_to change(Employee, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
