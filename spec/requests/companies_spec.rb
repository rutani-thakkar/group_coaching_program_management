require 'rails_helper'

RSpec.describe "Companies", type: :request do
  let!(:company) { create(:company) }

  describe 'GET /companies/:id' do
    context 'when the company exists' do
      it 'returns a successful response' do
        get company_path(company)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the company does not exist' do
      it 'returns a 404 not found status' do
        get company_path(id: 9999999)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
