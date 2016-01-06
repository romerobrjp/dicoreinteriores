class Admin::PreferencesController < Admin::AdminController
  before_action :set_preference, only: [:show, :edit, :update, :destroy]

  # GET /admin/preferences
  # GET /admin/preferences.json
  def index
    @preferences = Preference.all
  end

  # GET /admin/preferences/1
  # GET /admin/preferences/1.json
  def show
  end

  # GET /admin/preferences/new
  def new
    @preference = Preference.new
  end

  # GET /admin/preferences/1/edit
  def edit
  end

  # POST /admin/preferences
  # POST /admin/preferences.json
  def create
    @preference = Preference.new(preference_params)

    respond_to do |format|
      if @preference.save
        format.html { redirect_to @preference, notice: 'Preference was successfully created.' }
        format.json { render :show, status: :created, location: @preference }
      else
        format.html { render :new }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/preferences/1
  # PATCH/PUT /admin/preferences/1.json
  def update
    respond_to do |format|
      if @preference.update(preference_params)
        format.html { redirect_to @preference, notice: 'Preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @preference }
      else
        format.html { render :edit }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/preferences/1
  # DELETE /admin/preferences/1.json
  def destroy
    @preference.destroy
    respond_to do |format|
      format.html { redirect_to preferences_url, notice: 'Preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = Preference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
      params.require(:preference).permit(:color_1, :color_2, :color_3, :color_4, :color_5, :user_id)
    end
end
