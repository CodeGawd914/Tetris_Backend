class ArenaChannel < ApplicationCable::Channel
  def subscribed
    gameroom = Gameroom.find(params[:gameroom])
    stream_for gameroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
