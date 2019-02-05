class CreateMultiplayerGames < ActiveRecord::Migration[5.2]
  def change
    create_table :multiplayerGames do |t|
      t.integer :gameId
      t.integer :userId

      t.timestamps
    end
  end
end
