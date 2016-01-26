class Customer::ProjectRequestsController < Customer::CustomerController
  before_action :set_project_request, only: [:show, :edit, :update, :destroy]

  # GET /project_requests
  # GET /project_requests.json
  def index
    @project_requests = ProjectRequest.from_customer current_user
  end

  # GET /project_requests/1
  # GET /project_requests/1.json
  def show
  end

  # GET /project_requests/new
  def new
    @project_request = ProjectRequest.new
    @step = 1
  end

  # GET /project_requests/1/edit
  def edit
  end

  # POST /project_requests
  # POST /project_requests.json
  def create
    @project_request = ProjectRequest.new(project_request_params)
    @project_request.customer = current_user

    respond_to do |format|
      if @project_request.save
        format.html { redirect_to @project_request, notice: 'Project request was successfully created.' }
        format.json { render :show, status: :created  }
      else
        format.html { render :new }
        format.json { render json: @project_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_requests/1
  # PATCH/PUT /project_requests/1.json
  def update
    respond_to do |format|
      if @project_request.update(project_request_params)
        format.html { redirect_to @project_request, notice: 'Project request was successfully updated.' }
        format.json { render :show, status: :created }
      else
        format.html { render :edit }
        format.json { render json: @project_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_requests/1
  # DELETE /project_requests/1.json
  def destroy
    @project_request.destroy
    respond_to do |format|
      format.html { redirect_to project_requests_url, notice: 'Project request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_request
      @project_request = ProjectRequest.find_by_id_and_customer_id(params[:id], current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_request_params
      params.permit(:space_type_id, :description)
    end
end
