class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
