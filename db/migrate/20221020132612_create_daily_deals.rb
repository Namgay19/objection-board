class CreateDailyDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_deals do |t|
      t.datetime :start_time
      t.integer :amount, default: 0, null: false
      t.references :deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
