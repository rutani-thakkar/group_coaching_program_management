class CreateCoachesCoachingProgramsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :coaches_coaching_programs, id: false do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :coaching_program, null: false, foreign_key: true
    end
  end
end
