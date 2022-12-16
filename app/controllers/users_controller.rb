class UsersController < ApplicationController

    skip_before_action :authorize, only: [:create]

    def create
        @user = User.create!(user_params)
        render json: @user, status: :created
    end

    def index
        users = User.all
        render json: users, status: :ok
    end


    private

    def user_params
        params.permit(:firstName, :lastName, :email, :role_id, :password, :password_confirmation)
    end

end
