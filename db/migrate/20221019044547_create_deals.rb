class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :deal_target, default: 0
      t.integer :deal_amount, default: 0
      t.datetime :notificaton_time
      t.datetime :year

      t.timestamps
    end
  end
end
