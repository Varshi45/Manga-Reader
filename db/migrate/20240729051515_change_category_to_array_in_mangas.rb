class ChangeCategoryToArrayInMangas < ActiveRecord::Migration[7.1]
  def change
    rename_column :mangas, :subcategories, :category
    add_column :mangas, :category, :string, array: true, default: []
  end
end
