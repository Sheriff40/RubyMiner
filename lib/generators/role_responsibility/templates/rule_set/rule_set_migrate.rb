class CreateRuleSets < ActiveRecord::Migration[6.0]
  def change
    create_table :rule_sets do |t|
      t.text :model_action_hash

      t.timestamps
    end
  end
end
