class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        powers = Power.all
        render json: powers
    end
    
    def show
        power = find_power
        render json: power 
    end
    
    def update
        power = find_power
        power.update!(params.permit(:name, :description))
        render json: power
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
    
    
    private
    
    def find_power
        Power.find(params[:id])
    end
    
    def render_not_found_response
        render json: { error: "Power not found" }, status: :not_found
    end
end
