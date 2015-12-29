class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!

  def current_admin
    current_user
  end

  def prepare_config

  end
end