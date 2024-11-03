require 'rails_helper'


RSpec.describe "/menus", type: :request do

  let(:restaurant) { create(:restaurant) }

  let(:valid_attributes) {
    {
      restaurant_id: restaurant.id,
      title: "bakery"
    }
  }

  let(:invalid_attributes) {
    {
      title: nil
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Menu.create! valid_attributes
      get menus_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      menu = Menu.create! valid_attributes
      get menu_url(menu), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Menu" do
        expect {
          post menus_url,
               params: { menu: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Menu, :count).by(1)
      end

      it "renders a JSON response with the new menu" do
        post menus_url,
             params: { menu: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Menu" do
        expect {
          post menus_url,
               params: { menu: invalid_attributes }, as: :json
        }.to change(Menu, :count).by(0)
      end

      it "renders a JSON response with errors for the new menu" do
        post menus_url,
             params: { menu: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          title: "new menu title"
        }
      }

      it "updates the requested menu" do
        menu = Menu.create! valid_attributes
        patch menu_url(menu),
              params: { menu: new_attributes }, headers: valid_headers, as: :json
        menu.reload
      end

      it "renders a JSON response with the menu" do
        menu = Menu.create! valid_attributes
        patch menu_url(menu),
              params: { menu: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the menu" do
        menu = Menu.create! valid_attributes
        patch menu_url(menu),
              params: { menu: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested menu" do
      menu = Menu.create! valid_attributes
      expect {
        delete menu_url(menu), headers: valid_headers, as: :json
      }.to change(Menu, :count).by(-1)
    end
  end
end
