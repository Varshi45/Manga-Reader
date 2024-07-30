class AddRatingToMangas < ActiveRecord::Migration[6.1]
  def change
    add_column :mangas, :rating, :decimal, precision: 3, scale: 1, default: 0.0
  end
end