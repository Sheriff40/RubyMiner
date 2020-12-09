class RolesController < DashboardBaseController
  before_action :set_role, only: [:edit, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all.order(created_at: :desc)
  end

  # GET /roles/new
  def new
    @role = Role.new
    @models = eval(RuleSet.first.model_action_hash)
  end

  # GET /roles/1/edit
  def edit
    @models = eval(RuleSet.first.model_action_hash)
  end

  # POST /roles
  def create
    @role = Role.new(role_params)
    @role.role_rule = get_role_and_responsibility

    if @role.save
      flash[:notice] = "New Role Added"
      redirect_to roles_path
    else
      flash[:error] = "Role could not be added"
      render :new
    end
  end

  # PATCH/PUT /roles/1
  def update
    @role.role_rule = get_role_and_responsibility

    if @role.update(role_params)
      @role.role_and_responsibility.update!(role_rule: @role.role_rule)
      flash[:notice] = "The Role was updated"
      redirect_to roles_path
    else
      flash[:error] = "Role could not be updated"
      render :edit
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    respond_to do |format|
      format.html {redirect_to roles_url, notice: 'भूमिका सफलतापूर्वक मेटाईयो |'}
      format.json {head :no_content}
    end
  end

  private

  # create/update role and responsibility
  def get_role_and_responsibility
    role_hash = {}
    role_and_responsibilities = params[:role_and_responsibility]
    role_and_responsibilities.keys.each do |model_name|
      access_rules = eval(role_and_responsibilities[model_name].to_s)
      role_hash[model_name] = access_rules
    end
    return role_hash
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def role_params
    params.require(:role).permit(:name, :description, permission_ids: [])
  end

end
