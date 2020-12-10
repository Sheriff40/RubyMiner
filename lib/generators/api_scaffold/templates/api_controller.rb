class Api::V1::<%= plural_name.titleize %>Controller < ApiController

  before_action :verify_jwt_token
  before_action :set_<%= singular_name %>, only: [:update, :destroy, :show]

  def index
    query_params = request.query_parameters
    if !params.empty?
      begin
        @<%=plural_name %> = <%=singular_name %>.where(query_params)
        render json: @<%=plural_name %>
      rescue
        render json: {message: "Invalid query parameters"}, status: 404
      end
    else
      @<%=plural_name %> = <%=singular_name.titleize %>.all
      render json: @<%=plural_name %>
    end
  end

  def show
    if !@<%= singular_name%>.nil?
      render json: @<%= singular_name%>
    else
      render json: {message: "No records found"}, status: 400
    end
  end

  def create
    @<%= singular_name%> = <%= singular_name.titleize%>.new(<%= singular_name%>_params)
    if @<%= singular_name%>.save
      render json: @<%= singular_name%>
    else
      render json: {message: @<%=singular_name%>.errors.messages}, status: 500
    end
  end

  def update
    if !@<%= singular_name%>.nil?
      if @<%= singular_name%>.update(<%= singular_name%>_params)
        render json: @<%= singular_name%>
      else
        render json: {message: @<%=singular_name%>.errors.messages}, status: 500
      end
    else
      render json: {message: "No records found"}, status: 400
    end
  end


  def destroy
    if !@<%= singular_name%>.nil?
      if @<%= singular_name%>.destroy
        render json: {message: "Destroyed"}
      else
        render json: {message: @<%=singular_name%>.errors.messages}, status: 500
      end
    else
      render json: {message: "No records found"}, status: 400
    end

  end

  private

    def set_book
      @<%= singular_name%> = <%= singular_name.titleize%>.find_by_id(params[:id])
    end

    def <%= singular_name%>_params
      params.require(:<%= singular_name %>).permit(:<%=self.args.join(",:")%>)
    end
end