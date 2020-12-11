class RoleResponsibilityGenerator < Rails::Generators::Base

  require 'date'

  source_root File.expand_path('templates', __dir__)

# File for role_responsibility view, migration, and controller

  def get_current_date
    @current_date = DateTime.now.strftime("%Y%m%d%H%m%S").to_i
  end

  def role_model
    copy_file "role/role.rb", "app/models/role.rb"
  end

  def role_controller
    copy_file "role/role_controller.rb", "app/controllers/roles_controller.rb"
  end

  def role_migrate
    copy_file "role/role_migrate.rb", "db/migrate/#{@current_date + 1}_create_roles.rb"
  end

  def role_new_page
    copy_file "role/new.rb", "app/views/roles/new.rb"
  end

  def role_edit_page
    copy_file "role/edit.rb", "app/views/roles/edit.rb"
  end

  def role_form_page
    copy_file "role/form.rb", "app/views/roles/_form.html.slim"
  end

  def role_index
    copy_file "role/index.rb", "app/views/roles/index.rb"
  end

# Routes for roles
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
      f.write("\n\tresources :roles\nend")
    end
    File.delete("#{file_path}/routes.rb")
    File.rename("#{file_path}/routes_copy.rb","#{file_path}/routes.rb")
  end

# User associations with roles and user_roles
  def copy_user_associations
    contains_private_method = false

    file_path = "#{Rails.root}/app/models"
    user_file_contents = File.readlines("#{file_path}/user.rb")

    user_file_contents.each.with_index(0) do |line,index|
      if line.strip == "private"
        contains_private_method = true

        # Copy the association before the private method
        File.open("#{file_path}/user_copy.rb","a") do |f|
          f.write("\n\thas_many :user_roles, dependent: :destroy\n\thas_many :roles, through: :user_roles\n\n")
        end
      end

      # Continue copying the file until the last end keyword is encountered
      if index != (user_file_contents.count - 1)
        File.open("#{file_path}/user_copy.rb","a") do |f|
          f.write(line)
        end
      end
    end

    # Add associations if there is no private method and the copying has reached the last end keyword
    if !contains_private_method
      File.open("#{file_path}/user_copy.rb","a") do |f|
        f.write("\n\thas_many :user_roles, dependent: :destroy\n\thas_many :roles, through: :user_roles")
      end
    end

    File.open("#{file_path}/user_copy.rb","a") do |f|
      f.write("\nend")
    end

    File.delete("#{file_path}/user.rb")
    File.rename("#{file_path}/user_copy.rb","#{file_path}/user.rb")
  end

# Code for global rule set, copying it's views, controller, models, js, migration, routes

  def rule_set_model
    copy_file "rule_set/rule_set.rb", "app/models/rule_set.rb"
  end

  def rule_set_controller
    copy_file "rule_set/rule_set_controller.rb", "app/controllers/rule_sets_controller.rb"
  end

  def rule_set_migrate
    copy_file "rule_set/rule_set_migrate.rb", "db/migrate/#{@current_date + 2}_create_rule_sets.rb"
  end

  def rule_set_new_page
    copy_file "rule_set/new.rb", "app/views/rule_sets/new.rb"
  end

  def rule_set_edit_page
    copy_file "rule_set/edit.rb", "app/views/rule_sets/edit.rb"
  end

  def rule_set_form_page
    copy_file "rule_set/form.rb", "app/views/rule_sets/_form.html.slim"
  end

  def rule_set_show_page
    copy_file "rule_set/show.rb", "app/views/rule_sets/show.rb"
  end

  def rule_set_javascript
    copy_file "rule_set/rule_set_js.rb", "app/javascript/packs/rule_sets.js"
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
      f.write("\n\tresource :rule_set, except: :destroy do \n\t\t put :remove_action \n\tend\nend")
    end
    File.delete("#{file_path}/routes.rb")
    File.rename("#{file_path}/routes_copy.rb","#{file_path}/routes.rb")
  end

  def post_javascript
    file_path = "#{Rails.root}/app/javascript/packs"
    routes_files = File.readlines("#{file_path}/application.js")
    routes_files.each do |line|
      File.open("#{file_path}/application_copy.js","a") do |f|
        f.write(line)
      end
    end
    File.open("#{file_path}/application_copy.js","a") do |f|
      f.write("\nrequire(\"./rule_sets\")")
    end
    File.delete("#{file_path}/application.js")
    File.rename("#{file_path}/application_copy.js","#{file_path}/application.js")
  end


# Files for roles and responsibilities
  def role_and_responsibility_model
    copy_file "role_and_responsibility/role_and_responsibility_model.rb", "app/models/role_and_responsibility.rb"
  end

  def role_and_responsibility_migration
    copy_file "role_and_responsibility/role_and_responsibility_migrate.rb", "db/migrate/#{@current_date + 3}_create_role_and_responsibilities.rb"
  end

# Files for user_roles model and migration
  def user_role
    copy_file "user_role/user_role.rb", "app/models/user_role.rb"
  end

  def user_role_migration
    copy_file "user_role/user_role_migrate.rb", "db/migrate/#{@current_date + 4}_create_user_roles.rb"
  end

# Files for user CRUD operations and assigning roles

  def users_controller
    copy_file "user/users_controller.rb", "app/controllers/users_controller.rb"
  end

  def users_index
    copy_file "user/index.rb", "app/views/users/index.rb"
  end

  def users_edit
    copy_file "user/edit.rb", "app/views/users/edit.rb"
  end

  def users_new
    copy_file "user/new.rb", "app/views/users/new.rb"
  end

  def users_form
    copy_file "user/form.rb", "app/views/users/_form.html.slim"
  end

  def user_assign_role
    copy_file "user/assign_role.rb", "app/views/users/assign_role.rb"
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
      f.write("\n\tresources :users do \n\t\t member do \n\t\t\t get :assign_role\n\t\t\t patch :update_role\n\t\tend\n\tend\nend")
    end
    File.delete("#{file_path}/routes.rb")
    File.rename("#{file_path}/routes_copy.rb","#{file_path}/routes.rb")
  end


end