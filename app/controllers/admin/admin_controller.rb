class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin

  private
  def authenticate_admin
    unless authenticate_user! && current_user.type == 'Admin'
      redirect_to root_path, alert: t('generic.no_permission')
    end
  end

end
