class RuleSetsController < DashboardBaseController
  before_action :set_rule_set, only: [:show,:edit,:update, :remove_action]
  before_action :set_controllers, only: [:new,:edit]

  # GET /rule_sets/1
  def show
  end

  # GET /rule_sets/new
  def new
    if RuleSet.first.nil?
      @rule_set = RuleSet.new
    else
      flash[:error] = "A rule set already exists, edit the existing rule set"
      redirect_back(fallback_location: root_path)
    end
  end

  # GET /rule_sets/1/edit
  def edit
  end

  # POST /rule_sets
  def create
    if RuleSet.first.nil?
      @rule_set = RuleSet.new(rule_set_params)
      if @rule_set.save
        flash[:notice]= "Rule set was successfully created."
        redirect_to rule_set_path
      else
        flash[:error]= "Rule Set could not be saved."
        render :new
      end
    end
  end

  # PATCH/PUT /rule_sets/1
  def update
    model_action_params = params[:rule_set]
    if RuleSet.first.nil?
      @rule_set = RuleSet.new
      @rule_set.model_action_hash = model_action_params
      @rule_set.save!
    else
      @rule_set.update!(model_action_hash: model_action_params)
    end
    flash[:notice] = "Successfully saved Rule Set"
    redirect_to rule_set_path
  end

  def remove_action
    rule_set = eval(@rule_set.model_action_hash)
    controller_name = params[:controller_name]
    action_name = params[:action_name]
    rule_set[controller_name].delete(action_name)
    if @rule_set.update(model_action_hash: rule_set)
      render json: {actionId: "#{controller_name}#{action_name}"}
    end
  end

  private
    def set_controllers
      Rails.application.eager_load!
      @controllers = DashboardBaseController.descendants
    end

    def set_rule_set
      @rule_set = RuleSet.first
    end

    def rule_set_params
      params.permit(:model_action_hash)
    end
end
