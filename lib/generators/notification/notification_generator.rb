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

  def add_routes
    file_path = "#{Rails.root}/config"
    routes_files = File.readlines("#{file_path}/routes.rb")
    routes_files.each.with_index(0) do |line,index|
      if index != (routes_files.count - 1)
        File.open("#{file_path}/routes_copy.rb","a") do |f|
          f.write(line)
        end
      end
    end
    File.open("#{file_path}/routes_copy.rb","a") do |f|
      f.write("\n\tresources :notices, only: :index \n\tresources :user_notices, only: :update \nend")
    end
    File.delete("#{file_path}/routes.rb")
    File.rename("#{file_path}/routes_copy.rb","#{file_path}/routes.rb")
  end

  def notifications_javascript
    file_path = "#{Rails.root}/app/javascript/packs"
    routes_files = File.readlines("#{file_path}/application.js")
    routes_files.each do |line|
      File.open("#{file_path}/application_copy.js","a") do |f|
        f.write(line)
      end
    end
    File.open("#{file_path}/application_copy.js","a") do |f|
      f.write("\nrequire(\"./notification\")")
    end
    File.delete("#{file_path}/application.js")
    File.rename("#{file_path}/application_copy.js","#{file_path}/application.js")
  end

  def copy_user_associations
    file_path = "#{Rails.root}/app/models"
    routes_files = File.readlines("#{file_path}/user.rb")
    routes_files.each.with_index(0) do |line,index|
      if index != (routes_files.count - 1)
        File.open("#{file_path}/user_copy.rb","a") do |f|
          f.write(line)
        end
      end
    end
    File.open("#{file_path}/user_copy.rb","a") do |f|
      f.write("\n\thas_many :user_notices, dependent: :destroy\n\thas_many :notices, through: :user_notices\nend")
    end
    File.delete("#{file_path}/user.rb")
    File.rename("#{file_path}/user_copy.rb","#{file_path}/user.rb")
  end

end