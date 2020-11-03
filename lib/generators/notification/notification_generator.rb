class NotificationGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_notice
    copy_file "notice.rb", "app/models/notice.rb"
  end

  def create_user_notice
    copy_file "user_notice.rb", "app/models/user_notice.rb"
  end

  def create_notice_controller
    copy_file "notices_controller.rb", "app/controllers/notices_controller.rb"
  end

  def create_user_notice_controller
    copy_file "user_notices_controller.rb", "app/controllers/user_notices_controller.rb"
  end

  def create_notice_index
    copy_file "notice_index.rb", "app/views/notices/index.html.slim"
  end

  def create_header_partial
    copy_file "header.rb", "app/views/layouts/_header.html.slim"
  end

  def get_current_date
    @current_date = DateTime.now.strftime("%Y%m%d%H%m%S").to_i
  end

  def create_notice_migration
    get_current_date
    copy_file "notice_migration.rb", "db/migrate/#{@current_date + 2}_create_notices.rb"
  end

  def create_user_notices_migration
    get_current_date
    copy_file "user_notice_migration.rb", "db/migrate/#{@current_date + 2}_create_user_notices.rb"
  end

  def notice_javascript
    copy_file "notification_javascript.rb", "app/javascript/packs/notification.js"
  end

end