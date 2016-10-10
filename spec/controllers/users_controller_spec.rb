require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders the new user page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to user show page" do
        post :create, user: { username: "Debra", password: "password" }
        expect(response).to redirect_to user_url(User.find_by(username: "Debra"))
      end
    end
    context "with invalid params" do
      it "renders the new user page" do
        post :create, user: { username: "Debra", password: "pass" }
        expect(response).to render_template(:new)
      end
    end
  end

end
