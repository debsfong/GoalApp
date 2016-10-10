require 'rails_helper'

RSpec.describe Goal, type: :model do
  before { FactoryGirl.create(:goal) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:details) }
    it { should validate_presence_of(:user_id) }
    it { expect(:privacy).to be_falsey}
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
