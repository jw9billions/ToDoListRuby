require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before(:each) do
    @my_user = FactoryGirl.create(:user)
    sign_in @my_user
  end

  let(:item) { create(:item, user: @my_user) }
  let(:item2) { create(:item, user: @my_user) }

  describe "POST create" do
    it "increases the number of Items by 1" do
      expect { post :create, user_id: @my_user.id, item: {name: "test name"}}.to change(Item,:count).by(1)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
