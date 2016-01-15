require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:valid_attributes) {
    {name: 'Category Test'}
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  let(:category_in_header) {
    {name: 'Category Header', show_on_header: true}
  }


  describe "when valid_attributes" do
    it "creates category with required params" do
      expect {
        Category.create! valid_attributes
      }.to change(Category, :count).by(1)
    end

    it "creates a category to show in header" do
      Category.create! category_in_header
      expect(Category.header_categories.count).to eq(1)
      expect(Category.header_categories[0].name).to eq('Category Header')
    end

  end

  describe "when invalid_attributes" do
    it "do not create category with missing required params" do
      expect {
        Category.create! invalid_attributes
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end


end
