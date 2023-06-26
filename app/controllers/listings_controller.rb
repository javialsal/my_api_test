class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]

  def index
    @listings = Listing.pluck(:id, :num_rooms)
                        .map { |id, num_rooms|  {id: id, num_rooms: num_rooms} }

    @response = { listings: @listings }

    render json: @response
  end

  def show
    @response = {
        id: @listing.id,
        num_rooms: @listing.num_rooms
    }

    render json: @response
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render nothing: true, status: :created
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params)
      render nothing: true, status: :no_content
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    render nothing: true, status: :no_content
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
