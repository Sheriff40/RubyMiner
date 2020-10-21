class DashboardBaseController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard_base'
end