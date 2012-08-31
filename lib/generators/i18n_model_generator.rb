require 'rails/generators'

class I18nModelGenerator < Rails::Generators::NamedBase
  
  source_root File.expand_path('../templates', __FILE__)
  
  def create_model_file
    begin
      @model = Object.const_get(class_name)
    rescue NameError
      @model = false
    end
    template 'model.rb.erb', "app/models/#{file_name}_translation.rb"
    generate "i18n_migration #{file_name}"
  end
  
end