class AddRestaurantToMenu < ActiveRecord::Migration[7.2]
  def change
    add_reference :menus, :restaurant, null: false, foreign_key: true
  end
end