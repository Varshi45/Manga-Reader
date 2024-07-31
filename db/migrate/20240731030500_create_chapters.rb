class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.string :link
      t.references :manga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
