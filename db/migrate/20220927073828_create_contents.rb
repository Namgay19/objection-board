class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.references :book, null: false, foreign_key: true
      t.string :type
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
