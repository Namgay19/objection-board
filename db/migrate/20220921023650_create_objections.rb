class CreateObjections < ActiveRecord::Migration[7.0]
  def change
    create_table :objections do |t|
      t.string :title
      t.string :description
      t.integer :view_count, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
