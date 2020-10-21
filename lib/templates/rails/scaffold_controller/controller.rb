class <%= class_name.pluralize %>Controller < DashboardBaseController
  before_action :set_<%=singular_name%>, only: [:show, :edit, :update, :destroy]

  def index
    @<%=plural_name%> = <%=class_name%>.all
  end

  def show
  end

  def new
    @<%=singular_name%> = <%=class_name%>.new
  end

  def edit
  end

  def create
    @<%=singular_name%> = <%=class_name%>.new(<%=singular_name%>_params)
    if @<%=singular_name%>.save
      flash[:notice] = '<%=singular_name.titleize%> was successfully created.'
      redirect_to <%=plural_name%>_path
    else
      flash[:alert] = @<%=singular_name%>.errors.full_messages
      render :new
    end
  end

  def update
    if @<%=singular_name%>.update(<%=singular_name%>_params)
      flash[:notice] = '<%=singular_name.titleize%> was successfully updated.'
      redirect_to <%=plural_name%>_path
    else
      flash[:alert] = @<%=singular_name%>.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @<%=singular_name%>.destroy
      flash[:notice] = "<%=singular_name.titleize%> was successfully destroyed."
    else
      flash[:alert] = "<%=class_name%> could not be destroyed."
    end
    redirect_back(fallback_location: root_path)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_<%=singular_name%>
      @<%=singular_name%> = <%=class_name%>.find(params[:id])
    end
        
    # Only allow a list of trusted parameters through.
    def <%=singular_name%>_params
      params.require(:<%=singular_name%>).permit(:<%= attributes.map(&:name).join(', :') %>)
    end
end