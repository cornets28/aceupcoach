class ApplicationController < ActionController::API
    
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end
    
    def user_authorized?
        return render_unauthorized('Missing API token! Please provide a valid API token.') unless request.headers['Authorization'].present?
  
        token = request.headers['Authorization'].split[1]
        decoded_token = JWT.decode token, nil, false
        @user = User.find_by(id: decoded_token[0]['user_id'])
        @user.present?
        rescue JWT::DecodeError
            render_unauthorized('Invalid API token! Please provide a valid API token.')
    end

    def current_user
        token = request.headers['Authorization'].split[1]
        decoded_token = JWT.decode token, nil, false
        @user = User.find_by(id: decoded_token[0]['user_id'])
        @user
    end

    private

    def render_unauthorized(message)
        render json: { error: message }, status: :unauthorized
    end
end

