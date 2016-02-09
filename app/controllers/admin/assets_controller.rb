class Admin::AssetsController < Admin::AdminController
  before_action :set_admin_asset, only: [:show, :edit, :update, :destroy]
  before_action :set_request_host

  # GET /admin/assets
  # GET /admin/assets.json
  def index
    @assets = Asset.all
  end

  # GET /admin/assets/1
  # GET /admin/assets/1.json
  def show
  end

  # GET /admin/assets/new
  def new
    @asset = Asset.new
  end

  # GET /admin/assets/1/edit
  def edit
  end

  # POST /admin/assets
  # POST /admin/assets.json
  def create
    @asset = Asset.new(admin_asset_params)

    respond_to do |format|
      if @asset.save
        format.html { redirect_to admin_assets_url, notice: t('controllers.assets.create.success') }
        format.json { render :show, status: :created, location: @asset }
      else
        format.html { render :new }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/assets/1
  # PATCH/PUT /admin/assets/1.json
  def update
    respond_to do |format|
      if @asset.update(admin_asset_params)
        format.html { redirect_to admin_assets_url, notice: t('controllers.assets.udpate.success') }
        format.json { render :show, status: :ok, location: @asset }
      else
        format.html { render :edit }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/assets/1
  # DELETE /admin/assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to admin_assets_url, notice: t('controllers.assets.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_asset_params
      params[:asset].permit!
    end

    def set_request_host
      @hostname = 'http://' + (request.host || "www.dicoreinterirores.com.br") + (request.port != 80 ? ":#{request.port}" : '')
    end
end
