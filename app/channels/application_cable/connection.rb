module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    def find_user
      if verified_user = User.find_by(id: JWT.decode(request.params[:token], 'my_s3cr3t')[0]["user_id"])
        verified_user
      else
        reject_unauthorized_connection
      end

    end

  end
end
