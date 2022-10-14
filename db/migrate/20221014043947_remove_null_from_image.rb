class RemoveNullFromImage < ActiveRecord::Migration[7.0]
  def up
    change_column :images, :imageable_id, :bigint, null: true
    change_column :images, :imageable_type, :string, null: true
  end

  def down
    change_column :images, :imageable_id, :bigint, null: false
    change_column :images, :imageable_type, :string, null: false
  end
end
