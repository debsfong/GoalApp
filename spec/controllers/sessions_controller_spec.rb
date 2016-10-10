require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "renders the log in page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      before do
        FactoryGirl.create(
        :user,
        username: "Debra",
        password: "password")
      end

      it "redirects to user show page" do
        post :create, user: { username: "Debra", password: "password" }
        expect(response).to redirect_to user_url(User.find_by(username: "Debra"))
      end
    end

    context "with invalid params" do
      before do
        FactoryGirl.create(
        :user,
        username: "Debra",
        password: "password")
      end

      it "renders the log in page" do
        post :create, user: { username: "Debra", password: "pass" }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      FactoryGirl.create(
      :user,
      username: "Debra",
      password: "password")
      post :create, user: { username: "Debra", password: "password" }
      post :destroy
    end

    it "logs out the user" do
      expect(User.find_by(session_token: session[:session_token])).to be_nil
    end
    it "redirects to the login page" do
      expect(response).to redirect_to new_session_url
    end
  end
end
