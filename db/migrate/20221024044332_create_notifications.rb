class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :message
      t.integer :category, default: 0, null: false
      t.boolean :read, default: false, null: false

      t.timestamps
    end
  end
end
