class CreateRoleAndResponsibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :role_and_responsibilities do |t|
      t.references :role_responsibility_system, null: false, foreign_key: true
      t.string :role_rule

      t.timestamps
    end
  end
end
