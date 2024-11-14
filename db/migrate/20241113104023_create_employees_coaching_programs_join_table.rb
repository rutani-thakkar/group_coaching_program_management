class CreateEmployeesCoachingProgramsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :coaching_programs_employees, id: false do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :coaching_program, null: false, foreign_key: true
    end
  end
end
