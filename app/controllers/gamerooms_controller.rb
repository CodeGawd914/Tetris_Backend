class GameroomsController < ApplicationController
  def index
    gameroom = Gameroom.all
    render json: gameroom
  end

  def create
    gameroom = Gameroom.new(gameroom_params)
    if gameroom.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(GameroomSerializer.new(gameroom)).serializable_hash
      ActionCable.server.broadcast 'gameroom_channel', serialized_data
      head :ok
    end
  end

  private

  def gameroom_params
    params.require(:gameroom).permit(:title)
  end
end
