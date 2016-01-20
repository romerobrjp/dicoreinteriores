class Customer::HomeController < Customer::CustomerController
  def index
    @customer = current_user
  end

  def update
    @customer = current_user
    if @customer.update_attributes(params[:customer].permit!)
      redirect_to customer_root_path
    else
      render 'index'
    end
  end

  def update_password
    @customer = current_user
    @customer.update_with_password(user_password_params)
  end

  private
  def user_password_params
    params[:customer].permit(:current_password, :password, :password_confirmation)
  end
end
