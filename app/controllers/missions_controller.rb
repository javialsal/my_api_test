class MissionsController < ApplicationController
  def index
    @missions = Mission.pluck(:listing_id, :mission_type, :date, :price)
                       .map do |listing_id, mission_type, date, price|
                          {
                              listing_id: listing_id,
                              mission_type: mission_type,
                              date: date,
                              price: price
                          }
                       end

    @response = { missions: @missions }

    render json: @response
  end
end
