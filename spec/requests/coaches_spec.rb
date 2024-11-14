require 'rails_helper'

RSpec.describe "Coaches", type: :request do
  let!(:coach) { create(:coach) }
  let!(:company) { create(:company) }
  let!(:coaching_program1) { create(:coaching_program, company: company) }
  let!(:coaching_program2) { create(:coaching_program) }

  before do
    coach.coaching_programs << coaching_program1
    coach.coaching_programs << coaching_program2
  end

  describe 'GET /coaches/:id/dashboard' do
    context 'when the coach exists' do
      it 'returns a successful response and assigns @coach' do
        get dashboard_coach_path(coach)

        expect(response).to have_http_status(:ok)  # HTTP 200 OK
        expect(assigns(:coach)).to eq(coach)
      end

      it 'assigns @coaching_programs for the coach' do
        get dashboard_coach_path(coach)

        expect(assigns(:coaching_programs)).to match_array([coaching_program1, coaching_program2])
      end

      context 'when filtering by company_id' do
        it 'filters coaching programs by company_id' do
          get dashboard_coach_path(coach), params: { company_id: company.id }

          expect(assigns(:coaching_programs)).to match_array([coaching_program1])
        end
      end

      context 'when filtering by program_id' do
        it 'filters coaching programs by program_id' do
          get dashboard_coach_path(coach), params: { program_id: coaching_program1.id }

          expect(assigns(:coaching_programs)).to match_array([coaching_program1])
        end
      end

      context 'when filtering by both company_id and program_id' do
        it 'filters coaching programs by company_id and program_id' do
          get dashboard_coach_path(coach), params: { company_id: company.id, program_id: coaching_program1.id }

          expect(assigns(:coaching_programs)).to match_array([coaching_program1])
        end
      end
    end

    context 'when the coach does not exist' do
      it 'returns a 404 not found status' do
        get dashboard_coach_path(id: 9999999)

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
