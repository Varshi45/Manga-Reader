class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :link
      t.references :manga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
