require 'rails/generators'
require 'rails/generators/migration'

class I18nMigrationGenerator < Rails::Generators::NamedBase
  
  include Rails::Generators::Migration  
  source_root File.expand_path('../templates', __FILE__)
  
  def generate_migration
    migration_template 'migration.rb.erb', "db/migrate/create_#{table_name}_i18n.rb"
  end
  
  def self.next_migration_number(path)
    Time.now.utc.strftime('%Y%m%d%H%M%S')
  end  
  
end