class AddTitleToChapters < ActiveRecord::Migration[7.1]
  def change
    add_column :chapters, :title, :string
  end
end
