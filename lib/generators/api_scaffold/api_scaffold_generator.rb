class ApiScaffoldGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_api_controller
    template "api_controller.rb", "app/controllers/api/v1/#{plural_name}_controller.rb"
  end

  def parent_api_class
    template "parent_api.rb", "app/controllers/api_controller.rb"
  end
end