class UserNoticesController < ApplicationController
  before_action :set_user_notice, only: :update

  # PATCH/PUT /user_notices/1
  def update
    @user_notice.update!(status: true)
    url = @user_notice.notice.url
    render json: {notice_url: url}
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_notice
    @user_notice = UserNotice.find(params[:id])
  end
end
