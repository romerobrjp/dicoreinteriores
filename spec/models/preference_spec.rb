require 'rails_helper'

RSpec.describe Preference, type: :model do

  let(:valid_admin) {
    Admin.create!(name: 'Test', surname: 'Test', cpf: '123456', phone1: '123456', email: 'test@test.com', password: '12345678')
  }

  let(:valid_attributes) {
    {color_1: '#111111', color_2: '#222222', color_3: '#333333', specific_id: 'test01'}
  }

  describe "when valid attributes" do
    it "should create a preference" do
      expect {
        Preference.create! valid_attributes
      }.to change(Preference, :count).by(1)
    end

    it "should no create a preference with the same specific_id" do
      expect {
        Preference.create! valid_attributes
        Preference.create! valid_attributes
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end
