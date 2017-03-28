require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_orders" do
    it "returns http success" do
      get :user_orders
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #order_params" do
    it "returns http success" do
      get :order_params
      expect(response).to have_http_status(:success)
    end
  end

end
