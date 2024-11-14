class EmployeesController < ApplicationController
  before_action :find_company

  def new
    @employee = @company.employees.new
  end

  def create
    @employee = @company.employees.new(employee_params)
    if @employee.save
      @employee.coaching_programs << CoachingProgram.find(params.dig(:employee, :coaching_program_id))
      redirect_to company_path(@company), notice: 'Employee registered successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_company
    @company = Company.find(params[:company_id])
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :phone, :position, :department)
  end
end
