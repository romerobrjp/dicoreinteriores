require 'rails_helper'

RSpec.describe Attachment, type: :model do
  describe "when valid attributes" do
    it "should create" do
      expect {
        FactoryGirl.create(:attachment)
      }.to change(Attachment, :count).by(1)
    end
  end
end
