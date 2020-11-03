class CreateUserNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :user_notices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notice, null: false, foreign_key: true
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
