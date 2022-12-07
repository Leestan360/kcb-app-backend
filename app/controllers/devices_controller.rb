class DevicesController < ApplicationController

    rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique_entity_response

    def create
        device = Device.create!(device_params)
        render json: device, status: :created
    end

    def index
        devices = Device.all
        render json: devices, status: :ok
    end

    private

    def device_params
        params.require(:device).permit(:uid, :deviceType, :lastSeen, :user_id)
    end

    def render_not_unique_entity_response(exception)
        render json: { errors: ["device uid already exists"] }, status: :unprocessable_entity
      end

end
