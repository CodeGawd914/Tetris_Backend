class User < ApplicationRecord
  has_secure_password
  has_many :conversations
  has_many :multiplayerGames
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
  has_many :games, through: :multiplayerGames
  validates :userName, uniqueness: {case_sensitive: false}

end
