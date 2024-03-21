class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end
    
    def user_authorized?
        return false unless request.headers['Authorization']

        token = request.headers['Authorization'].split[1]
        decoded_token = JWT.decode token, nil, false
        @user = User.find_by(id: decoded_token[0]['user_id'])
        !!@user
    end

    def current_user
        token = request.headers['Authorization'].split[1]
        decoded_token = JWT.decode token, nil, false
        @user = User.find_by(id: decoded_token[0]['user_id'])
        @user
    end
end
