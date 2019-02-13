class CreateGamerooms < ActiveRecord::Migration[5.2]
  def change
    create_table :gamerooms do |t|
      t.string :title
      t.integer :gameId
      t.integer :userId

      t.timestamps
    end
  end
end
