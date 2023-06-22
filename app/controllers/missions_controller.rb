class MissionsController < ApplicationController
  def index
    @missions = Mission.all

    @response = { missions: @missions }

    render json: @missions
  end
end
