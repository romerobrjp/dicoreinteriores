class Customer::CustomerController < ApplicationController
  layout 'customer'

  before_action :authenticate_customer

  private
  def authenticate_customer
    unless authenticate_user! && current_user.type == 'Customer'
      redirect_to root_path, alert: t('generic.no_permission')
    end
  end
end
