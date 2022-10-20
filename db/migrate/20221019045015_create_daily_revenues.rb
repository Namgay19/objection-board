class CreateDailyRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_revenues do |t|
      t.datetime :start_time
      t.integer :amount, default: 0, null: false
      t.references :revenue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
