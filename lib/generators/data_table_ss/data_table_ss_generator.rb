class DataTableSsGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_model_specific_data_table
    copy_file "data_table.rb", "app/datatables/#{file_name}_data_table.rb"
  end

end