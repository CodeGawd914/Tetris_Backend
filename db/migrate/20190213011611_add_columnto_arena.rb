class AddColumntoArena < ActiveRecord::Migration[5.2]
  def change
    add_column :arenas, :gameroom_id, :integer
  end
end
