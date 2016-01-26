require 'rails_helper'

RSpec.describe ProjectRequest, type: :model do

  describe "when valid_parameters" do
    it "should create a new entity" do
      expect {
        FactoryGirl.create(:project_request)
      }.to change(ProjectRequest, :count).by(1)
    end
  end

  describe "when missing valid attributes" do
    it "should raise error" do
      expect {
        ProjectRequest.create!({description: ''})
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
