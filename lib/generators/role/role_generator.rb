class RoleGenerator < Rails::Generators::Base

  require 'date'

  source_root File.expand_path('templates', __dir__)

  def role_model
    copy_file "role.rb", "app/models/role.rb"
  end

  def role_controller
    copy_file "role_controller.rb", "app/controller/roles_controller.rb"
  end

  def role_migrate
    copy_file "role_migrate.rb", "db/migrate/#{@current_date + 1}_create_roles.rb"
  end

  def role_new_page
    copy_file "new.rb", "app/views/roles/new.rb"
  end

  def role_edit_page
    copy_file "edit.rb", "app/views/roles/edit.html.slim"
    end

  def role_form_page
    copy_file "form.rb", "app/views/roles/_form.html.slim"
  end

  def role_index
    copy_file "index.rb", "app/views/roles/index.slim"
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
      f.write("\n\tresources :roles")
    end
    File.delete("#{file_path}/routes.rb")
    File.rename("#{file_path}/routes_copy.rb","#{file_path}/routes.rb")
  end

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


end