class CreateRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :revenues do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :sales_target, default: 0, null: false
      t.integer :sales_amount, default: 0, null: false
      t.string :currency
      t.datetime :notification_time
      t.datetime :year

      t.timestamps
    end
  end
end
