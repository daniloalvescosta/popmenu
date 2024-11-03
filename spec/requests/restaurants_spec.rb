require 'rails_helper'

RSpec.describe "/restaurants", type: :request do

  let(:valid_attributes) {
    {
      name: "my restaurant",
      image_url: "my_url"
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      image_url: nil
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Restaurant.create! valid_attributes
      get restaurants_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      restaurant = Restaurant.create! valid_attributes
      get restaurant_url(restaurant), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Restaurant" do
        expect {
          post restaurants_url,
               params: { restaurant: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Restaurant, :count).by(1)
      end

      it "renders a JSON response with the new restaurant" do
        post restaurants_url,
             params: { restaurant: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Restaurant" do
        expect {
          post restaurants_url,
               params: { restaurant: invalid_attributes }, as: :json
        }.to change(Restaurant, :count).by(0)
      end

      it "renders a JSON response with errors for the new restaurant" do
        post restaurants_url,
             params: { restaurant: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "new restaurant name" }
      }

      it "updates the requested restaurant" do
        restaurant = Restaurant.create! valid_attributes
        patch restaurant_url(restaurant),
              params: { restaurant: new_attributes }, headers: valid_headers, as: :json
        restaurant.reload
      end

      it "renders a JSON response with the restaurant" do
        restaurant = Restaurant.create! valid_attributes
        patch restaurant_url(restaurant),
              params: { restaurant: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the restaurant" do
        restaurant = Restaurant.create! valid_attributes
        patch restaurant_url(restaurant),
              params: { restaurant: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested restaurant" do
      restaurant = Restaurant.create! valid_attributes
      expect {
        delete restaurant_url(restaurant), headers: valid_headers, as: :json
      }.to change(Restaurant, :count).by(-1)
    end
  end
end
