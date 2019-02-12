class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :userName
      t.string :password_digest
      t.integer :wins,:default => 0
      t.integer :losses,:default => 0
      t.integer :score,:default => 0



      t.timestamps
    end
  end
end
