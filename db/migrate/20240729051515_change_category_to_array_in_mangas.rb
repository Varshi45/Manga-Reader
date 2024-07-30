class ChangeCategoryToArrayInMangas < ActiveRecord::Migration[7.1]
  def change
    remove_column :mangas, :category, :string
    add_column :mangas, :category, :string, array: true, default: []
  end
end
