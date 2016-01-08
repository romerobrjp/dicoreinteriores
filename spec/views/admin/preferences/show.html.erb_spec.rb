require 'rails_helper'

RSpec.describe "admin/preferences/show", type: :view do
  before(:each) do
    @admin_preference = assign(:admin_preference, Admin::Preference.create!(
      :color_1 => "Color 1",
      :color_2 => "Color 2",
      :color_3 => "Color 3",
      :color_4 => "Color 4",
      :color_5 => "Color 5",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Color 1/)
    expect(rendered).to match(/Color 2/)
    expect(rendered).to match(/Color 3/)
    expect(rendered).to match(/Color 4/)
    expect(rendered).to match(/Color 5/)
    expect(rendered).to match(//)
  end
end
