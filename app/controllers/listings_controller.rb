class ListingsController < ApplicationController
  def index
    @listings = Listing.pluck(:id, :num_rooms)
                       .map { |id, num_rooms| {id: id, num_rooms: num_rooms} }

    @response = { listings: @listings }

    render json: @listings
  end

  def show
    @response = {
      id: @listing.id,
      num_rooms: @listing.num_rooms
    }

    render jason: @response
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
    if @listing.update(listing_params).save
      render nothing: true, status: :created
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    render
  end

  private

  def listing_params
    params.require(:listing).permit(:id, :num_rooms)
  end
end
