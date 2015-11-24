require 'rails_helper'

RSpec.describe "admin/assets/edit", type: :view do
  before(:each) do
    @admin_asset = assign(:admin_asset, Admin::Asset.create!())
  end

  it "renders the edit admin_asset form" do
    render

    assert_select "form[action=?][method=?]", admin_asset_path(@admin_asset), "post" do
    end
  end
end
