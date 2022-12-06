class UsersController < ApplicationController

    rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique_entity_response


    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    def index
        users = User.all
        render json: users, status: :ok
    end


    private

    def user_params
        params.permit(:firstName, :lastName, :email, :role_id, :password, :password_confirmation)
    end

    def render_not_unique_entity_response(exception)
        render json: { errors: ["email already exists"] }, status: :unprocessable_entity
    end

end
