require 'rails_helper'

RSpec.describe SpaceType, type: :model do

  describe "when valid attributes" do
    it "should create the entity" do
      expect {
        FactoryGirl.create(:space_type)
      }.to change(SpaceType, :count).by(1)
    end
  end

  describe "when invalid attributes" do
    it "should create the entity" do
      expect {
        SpaceType.create!(name: '')
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
