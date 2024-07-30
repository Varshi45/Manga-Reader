class AddViewsCountToMangas < ActiveRecord::Migration[7.1]
  def change
    add_column :mangas, :views_count, :integer, default: 0, null: false
  end
end
