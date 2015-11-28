class Admin::AdminController < ApplicationController
  layout 'admin'

  def current_admin
    Admin.first
  end

end
