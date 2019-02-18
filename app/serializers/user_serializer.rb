class UserSerializer < ActiveModel::Serializer
  attributes :id, :userName, :wins, :losses 
  has_many :friendships
end
