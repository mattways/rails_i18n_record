require 'rails/generators'

class I18nGenerator < Rails::Generators::NamedBase
  
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)
  
  def create_model
    begin
      @model = Object.const_get(class_name)
    rescue NameError
      @model = false
    end
    template 'model.erb', "app/models/#{file_name}_translation.rb"
  end
  
  def create_migration
    migration_template 'migration.erb', "db/migrate/create_#{table_name}_i18n.rb"
  end
  
  def self.next_migration_number(path)
    Time.now.utc.strftime '%Y%m%d%H%M%S'
  end  
  
end
