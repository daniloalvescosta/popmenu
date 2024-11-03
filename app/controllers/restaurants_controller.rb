class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show update destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render :show, status: :created, location: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end


  def update
    if @restaurant.update(restaurant_params)
      render :show, status: :ok, location: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @restaurant.destroy!
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :image_url)
    end
end
