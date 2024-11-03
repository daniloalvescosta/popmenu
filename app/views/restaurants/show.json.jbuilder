json.partial! "restaurants/restaurant", restaurant: @restaurant
json.menus @restaurant.menus.map do |menu|
  { id: menu.id, title: menu.title }
end
