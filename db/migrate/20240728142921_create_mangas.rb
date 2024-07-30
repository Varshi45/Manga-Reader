class CreateMangas < ActiveRecord::Migration[7.1]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :author
      t.date :first_published_date
      t.text :description
      t.string :subcategories, array: true, default: []

      t.timestamps
    end
  end
end
