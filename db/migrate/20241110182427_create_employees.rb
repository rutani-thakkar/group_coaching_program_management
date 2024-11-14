class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :position
      t.string :department
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
