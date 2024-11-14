class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render status: :not_found, json: { error: "Company not found" }
  end
end
