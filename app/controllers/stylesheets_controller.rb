class StylesheetsController < ApplicationController

  layout false

  def theme
    @preference = Preference.find_by_specific_id('global_prefs')
    file_path = "#{Rails.root.to_s}/app/assets/stylesheets/theme.css.erb"
    render(file: file_path, content_type: 'text/css')
  end
end
