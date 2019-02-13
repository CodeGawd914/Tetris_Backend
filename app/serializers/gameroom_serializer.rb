class GameroomSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :arenas
end
