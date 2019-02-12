class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :conversations, through: :messages
  has_many :multiplayerGames
  has_many :games, through: :multiplayerGames
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
  validates :userName, presence: true, uniqueness: {case_sensitive: false}

end
