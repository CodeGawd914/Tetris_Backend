class ApplicationController < ActionController::API

  def encode_token(payload)

    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    # { 'Authorization': 'Bearer <token>' } remember to setup key of auth in fetch for user
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      # headers: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(auth_header, 'my_s3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
      # or nil if we can't decode the token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def logged_in?
    !!current_user
  end
end
