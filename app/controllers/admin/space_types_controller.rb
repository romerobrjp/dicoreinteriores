class Admin::SpaceTypesController < Admin::AdminController
  before_action :set_space_type, only: [:edit, :update, :destroy]

  # GET /space_types
  # GET /space_types.json
  def index
    @space_types = SpaceType.all
  end

  # GET /space_types/new
  def new
    @space_type = SpaceType.new
  end

  # GET /space_types/1/edit
  def edit
  end

  # POST /space_types
  # POST /space_types.json
  def create
    @space_type = SpaceType.new(space_type_params)

    respond_to do |format|
      if @space_type.save
        format.html { redirect_to admin_space_types_path, notice: t('helpers.submit.create_success', model: SpaceType.model_name.human) }
        format.json { render :show, status: :created, location: @space_type }
      else
        format.html { render :new }
        format.json { render json: @space_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_types/1
  # PATCH/PUT /space_types/1.json
  def update
    respond_to do |format|
      if @space_type.update(space_type_params)
        format.html { redirect_to admin_space_types_path, notice: t('helpers.submit.update_success', model: SpaceType.model_name.human) }
        format.json { render :show, status: :ok, location: @space_type }
      else
        format.html { render :edit }
        format.json { render json: @space_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_types/1
  # DELETE /space_types/1.json
  def destroy
    @space_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_space_types_url, notice: t('helpers.submit.delete_success', model: SpaceType.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_type
      @space_type = SpaceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_type_params
      params[:space_type].permit(:name, :picture)
    end
end
