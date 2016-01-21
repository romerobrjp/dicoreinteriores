require 'rails_helper'

RSpec.describe Attatchment, type: :model do
  describe "when valid attributes" do
    it "should create" do
      expect {
        FactoryGirl.create(:attatchment)
      }.to change(Attatchment, :count).by(1)      
    end
  end
end
