class RolesController < ApplicationController

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

end
