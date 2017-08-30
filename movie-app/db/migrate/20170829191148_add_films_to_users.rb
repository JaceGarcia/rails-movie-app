class AddFilmsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :films, foreign_key: true
  end
end
