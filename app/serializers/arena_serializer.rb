class ArenaSerializer < ActiveModel::Serializer
  attributes :id, :spots, :gameroom_id
end
