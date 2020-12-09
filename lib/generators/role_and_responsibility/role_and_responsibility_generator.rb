class RoleGenerator < Rails::Generators::Base

  require 'date'

  source_root File.expand_path('templates', __dir__)

  def role_model
    copy_file "role_and_responsibility_model.rb", "app/models/role_and_responsibility.rb"
  end

  def role_migrate
    copy_file "role_and_responsibility_migrate.rb", "db/migrate/#{@current_date + 1}_create_role_and_responsibilities.rb"
  end

end