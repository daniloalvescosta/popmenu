require 'rails_helper'

RSpec.describe DataImportsController, type: :controller do
  describe 'POST #create' do
    let(:valid_params) do
      {
        data: [
          {
            "Restaurant" => {
              "name" => "Restaurant title",
              "menus" => {
                "title" => "menu title",
                "menu_items" => {
                  "title" => "menu item title"
                }
              }
            }
          },
        ].to_json
      }
    end

    it 'creates restaurants, menus, and menu items' do
      expect {
        post :create, params: valid_params
      }.to change { Restaurant.count }.by(1)
        .and change { Menu.count }.by(1)
        .and change { MenuItem.count }.by(1)

      expect(response).to have_http_status(:created)
    end
  end
end
