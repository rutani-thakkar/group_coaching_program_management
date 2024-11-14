class CoachesController < ApplicationController
  def dashboard
    @coach = Coach.find(params[:id])
    @coaching_programs = @coach.coaching_programs

    if params[:company_id].present?
      @coaching_programs = @coaching_programs.where(company_id: params[:company_id])
    end

    if params[:program_id].present?
      @coaching_programs = @coaching_programs.where(id: params[:program_id])
    end

  rescue ActiveRecord::RecordNotFound
    render status: :not_found, json: { error: 'Coach not found' }
  end
end
