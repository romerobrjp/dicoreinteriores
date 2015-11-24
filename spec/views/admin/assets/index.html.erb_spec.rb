require 'rails_helper'

RSpec.describe "admin/assets/index", type: :view do
  before(:each) do
    assign(:admin_assets, [
      Admin::Asset.create!(),
      Admin::Asset.create!()
    ])
  end

  it "renders a list of admin/assets" do
    render
  end
end
