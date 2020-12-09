class RuleSetGenerator < Rails::Generators::Base

  require 'date'

  source_root File.expand_path('templates', __dir__)

  def rule_set_model
    copy_file "rule_set.rb", "app/models/rule_set.rb"
  end

  def rule_set_controller
    copy_file "rule_set_controller.rb", "app/controller/rule_sets_controller.rb"
  end

  def rule_set_migrate
    copy_file "rule_set_migrate.rb", "db/migrate/#{@current_date + 1}_create_rule_sets.rb"
  end

  def rule_set_new_page
    copy_file "new.rb", "app/views/rule_sets/new.rb"
  end

  def rule_set_edit_page
    copy_file "edit.rb", "app/views/rule_sets/edit.html.slim"
    end

  def rule_set_form_page
    copy_file "form.rb", "app/views/rule_sets/_form.html.slim"
  end

  def rule_set_show_page
    copy_file "show.rb", "app/views/rule_sets/show.html.slim"
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
      f.write("\n\tresource :rule_set, except: :destroy do \n\t\t put :remove_action \n\tend")
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
      f.write("\nrequire(\"./rule_set\")")
    end
    File.delete("#{file_path}/application.js")
    File.rename("#{file_path}/application_copy.js","#{file_path}/application.js")
  end

end