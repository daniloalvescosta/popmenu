class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[ show update destroy ]

  def index
    @menu_items = MenuItem.all
  end

  def show
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      render :show, status: :created, location: @menu_item
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      render :show, status: :ok, location: @menu_item
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item.destroy!
  end

  private
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    def menu_item_params
      params.require(:menu_item).permit(:title, :menu_id)
    end
end
