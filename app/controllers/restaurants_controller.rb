class RestaurantsController < ApplicationController
  def index
    restaurant= {}
  end

  def search
    # @id = params[:search_keys][:id]
    id = '1111' 
    # @latitude = params[:search_keys][:latitude]
    latitude = '35.703350' 
    # @longitude = params[:search_keys][:longitude]
    longitude = '139.770736'
    restaurant = Restaurant.restaurant_search(@id,@latitude,@longitude)
  end
end
