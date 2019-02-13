class ArenasController < ApplicationController
  def create
    @arena = Arena.create(arena_params)
    render json: @arena
    gameroom = Gameroom.find(arena_params[:game_id])
    if arena.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(MessageSerializer.new(arena)).serializable_hash
      MessagesChannel.broadcast_to gameroom, serialized_data
      head :ok
    end

  end

  private

  def arena_params
    params.require(:arena).permit(:spots, :gameroom_id, :user_id)
  end
end
