class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show update destroy ]

  def index
    @menus = Menu.all
  end

  def show
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      render :show, status: :created, location: @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  def update
    if @menu.update(menu_params)
      render :show, status: :ok, location: @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menu.destroy!
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:title, :restaurant_id)
    end
end
