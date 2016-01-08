require 'rails_helper'

RSpec.describe "admin/preferences/new", type: :view do
  before(:each) do
    assign(:admin_preference, Admin::Preference.new(
      :color_1 => "MyString",
      :color_2 => "MyString",
      :color_3 => "MyString",
      :color_4 => "MyString",
      :color_5 => "MyString",
      :user => nil
    ))
  end

  it "renders new admin_preference form" do
    render

    assert_select "form[action=?][method=?]", admin_preferences_path, "post" do

      assert_select "input#admin_preference_color_1[name=?]", "admin_preference[color_1]"

      assert_select "input#admin_preference_color_2[name=?]", "admin_preference[color_2]"

      assert_select "input#admin_preference_color_3[name=?]", "admin_preference[color_3]"

      assert_select "input#admin_preference_color_4[name=?]", "admin_preference[color_4]"

      assert_select "input#admin_preference_color_5[name=?]", "admin_preference[color_5]"

      assert_select "input#admin_preference_user_id[name=?]", "admin_preference[user_id]"
    end
  end
end
