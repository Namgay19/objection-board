class AddViewedAt < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :viewed_at, :datetime, index: true
    add_column :audios, :viewed_at, :datetime, index: true
    add_column :videos, :viewed_at, :datetime, index: true
    add_column :stories, :viewed_at, :datetime, index: true
  end
end
