class ApiScaffoldGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_api_controller
    template "api_controller.rb", "app/controllers/api/v1/#{file_name}.rb"
  end

end