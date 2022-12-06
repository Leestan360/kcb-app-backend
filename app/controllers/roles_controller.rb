class RolesController < ApplicationController

    rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique_entity_response

    def create
        role = Role.create!(role_params)
        render json: role, status: :created
    end

    def index
        roles = Role.all
        render json: roles, status: :ok
    end

    private

    def role_params
        params.require(:role).permit(:permissions)
    end

    def render_not_unique_entity_response(exception)
        render json: { errors: ["role already exists"] }, status: :unprocessable_entity
    end

end
