class Gameroom < ApplicationRecord
  has_many :arenas
  has_many :users, through: :arenas
end
