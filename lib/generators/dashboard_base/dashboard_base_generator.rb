class DashboardBaseGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_dashboard_base_controller
    copy_file "dashboard_base_controller.rb", "app/controllers/dashboard_base_controller.rb"
  end

  def create_dashboard_base_file
    copy_file "dashboard_base.rb", "app/views/layouts/dashboard_base.html.slim"
  end

  def create_sidebar_base_file
    copy_file "sidebar.rb", "app/views/layouts/_sidebar.html.slim"
  end

  def create_dashboard_contoller
    copy_file "dashboard_controller.rb", "app/controllers/dashboards_controller.rb"
  end

  def create_dashboard_index
    copy_file "dashboard_index.html.rb", "app/views/dashboards/index.html.slim"
  end

  def create_login_page
    copy_file "login.rb", "app/views/devise/sessions/new.html.slim"
  end

  def create_registration_page
    copy_file "registration.rb", "app/views/devise/registrations/new.html.slim"
  end

  def create_application_slim
    copy_file "application_slim.rb", "app/views/layouts/application.html.slim"
  end

  def upload_avatar_pic
    copy_file "avatar.png", "app/assets/images/avatar.png"
  end

end