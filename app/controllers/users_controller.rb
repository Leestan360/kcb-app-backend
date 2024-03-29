class UsersController < ApplicationController

    skip_before_action :authorize, only: [:create, :index]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
    
    def create
        @user = User.create!(user_params)
        # if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        # else
        #   render json: { error: 'failed to create user' }, status: :unprocessable_entity
        # end
    end

    def index
        users = User.all
        render json: users, status: :ok
    end


    private

    def user_params
        params.require(:user).permit(:firstName, :lastName, :email, :role_id, :password, :password_confirmation)
    end

end
