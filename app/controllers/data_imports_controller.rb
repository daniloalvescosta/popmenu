class DataImportsController < ApplicationController
  def create
    data = JSON.parse(params[:data])

    data.each do |restaurant_data|
      restaurant = Restaurant.create!(name: restaurant_data['Restaurant']['name'])
      menu_data = restaurant_data['Restaurant']['menus']
      menu = Menu.create!(title: menu_data['title'], restaurant: restaurant)
      MenuItem.create!(title: menu_data['menu_items']['title'], menu: menu)
    end

    render json: { message: 'Data imported successfully' }, status: :created
  end
end
