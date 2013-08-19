require 'rails/generators'

class TranslationGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)
  
  def create_model
    @model = Object.const_get(class_name)
    template 'model.rb.erb', "app/models/#{file_name}_translation.rb"
  end
  
  def create_migration
    migration_template 'migration.rb.erb', "db/migrate/create_#{singular_table_name}_translations.rb"
  end
  
  def self.next_migration_number(path)
    Time.now.utc.strftime '%Y%m%d%H%M%S'
  end  
  
end
