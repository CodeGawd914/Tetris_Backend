class GameroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "gameroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
