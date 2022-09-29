class CreateAudios < ActiveRecord::Migration[7.0]
  def change
    create_table :audios do |t|
      t.string :title
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
