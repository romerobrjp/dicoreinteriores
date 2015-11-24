require 'rails_helper'

RSpec.describe "admin/assets/show", type: :view do
  before(:each) do
    @admin_asset = assign(:admin_asset, Admin::Asset.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
