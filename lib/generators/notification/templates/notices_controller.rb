class NoticesController < DashboardBaseController

  # GET /notices
  def index
    @user_notices = current_user.user_notices.order(created_at: :desc)
  end

end
