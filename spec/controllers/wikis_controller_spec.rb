require 'rails_helper'

def login_user
  @request.env["devise.mapping"] = Devise.mappings[:user]
  user = FactoryGirl.create(:user)
  sign_in user
end

RSpec.describe WikisController, type: :controller do
  let(:my_user) {User.create!(email: "elepage@bowdoin.edu", password: "password", confirmed_at: Date.today)}
  let(:my_wiki) {Wiki.create!(title: "New Wiki Title", body: "New Wiki body", private: true, user: my_user)}

  before(:each) do
      login_user
    end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wikis" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST create" do


    it "increases the number of Wikis by 1" do
      expect{ post :create, params: { wiki: {title: "new wiki title", body: "new wiki body"} } }.to change(Wiki,:count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      post :create, params: {wiki: {title: "new wiki title", body: "new wiki body"}}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects the new post" do
      post :create, params: {wiki: {title: "new wiki title", body: "new wiki body", private: true, user: my_user}}
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
end
