require 'rails_helper'

RSpec.describe "admin/preferences/index", type: :view do
  before(:each) do
    assign(:admin_preferences, [
      Admin::Preference.create!(
        :color_1 => "Color 1",
        :color_2 => "Color 2",
        :color_3 => "Color 3",
        :color_4 => "Color 4",
        :color_5 => "Color 5",
        :user => nil
      ),
      Admin::Preference.create!(
        :color_1 => "Color 1",
        :color_2 => "Color 2",
        :color_3 => "Color 3",
        :color_4 => "Color 4",
        :color_5 => "Color 5",
        :user => nil
      )
    ])
  end

  it "renders a list of admin/preferences" do
    render
    assert_select "tr>td", :text => "Color 1".to_s, :count => 2
    assert_select "tr>td", :text => "Color 2".to_s, :count => 2
    assert_select "tr>td", :text => "Color 3".to_s, :count => 2
    assert_select "tr>td", :text => "Color 4".to_s, :count => 2
    assert_select "tr>td", :text => "Color 5".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
