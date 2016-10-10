require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do

  describe "validations" do
    before do
      FactoryGirl.create(
      :user,
      username: "JC",
      password: "goodpassword")
    end

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it { should have_many(:goals) }
  end

  describe "::find_by_credentials" do
    let!(:user) do
      FactoryGirl.create(
      :user,
      username: "JC",
      password: "goodpassword")
    end

    it "returns the correct user with valid credentials" do
      # debugger
      found_user = User.find_by_credentials("JC", "goodpassword")
      expect(found_user).to eq(user)
    end
    it "returns nil with invalid credentials" do
      expect(User.find_by_credentials("JC", "badpassword")).to be_nil
    end

  end


end
