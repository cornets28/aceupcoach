module Api
    module V1
      # All actions are in used for user authentication.
      class UsersController < ApplicationController
        def index
          if user_authorized?
            render json: User.all
          else
            render json: { error: 'Invalid API token! User cannot be found.' }, status: :unprocessable_entity
          end
        end
  
        def create
          @user = User.create(user_params)
  
          if @user.valid?
            token = encode_token({ user_id: @user.id })
            render json: { user: @user, token: }, status: :ok
          else
            render json: { error: 'username or email has already been taken' }, status: :unprocessable_entity
          end
        end
  
        def login
          @user = User.find_by(username: user_params[:username])
  
          if @user&.authenticate(user_params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user: @user, token: }, status: :ok
          else
            render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
          end
        end
  
        private
  
        def user_params
          params.permit(:full_name, :username, :phone_number, :email, :address, :password)
        end
      end
    end
  end