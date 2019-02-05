class Game < ApplicationRecord
  has_many :multiplayerGames
  has_many :users, through: :multiplayerGames
end
