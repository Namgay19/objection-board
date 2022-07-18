class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :category, default: 0, null: false
      t.integer :effect, default: 0, null: false
      t.datetime :start_time, index: true
      t.datetime :end_time, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
