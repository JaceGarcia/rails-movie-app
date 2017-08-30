class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :title
      t.string :genre
      t.string :year
      t.text :synopis
      t.string :picture
      t.boolean :favorits

      t.timestamps
    end
  end
end
