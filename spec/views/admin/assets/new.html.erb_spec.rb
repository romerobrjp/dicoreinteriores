require 'rails_helper'

RSpec.describe "admin/assets/new", type: :view do
  before(:each) do
    assign(:admin_asset, Admin::Asset.new())
  end

  it "renders new admin_asset form" do
    render

    assert_select "form[action=?][method=?]", admin_assets_path, "post" do
    end
  end
end
