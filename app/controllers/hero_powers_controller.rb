class HeroPowersController < ApplicationController
    
    def index
        hero_powers = HeroPower.all
        render json: hero_powers
    end
    
    def create
        hero_power = HeroPower.create!(params_hero_power)
        render json: hero_power.hero
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
    
    
    private
    
    def params_hero_power
        params.permit(:strength, :power_id, :hero_id)
    end

end
