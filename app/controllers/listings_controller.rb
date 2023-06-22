class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    render :json => @listings
  end
  def show
  end
  def create
  end
  def update
  end
  def delete
  end
end
