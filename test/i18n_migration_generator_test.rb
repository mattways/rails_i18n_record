require 'test_helper'
require 'rails/generators'
require 'generators/i18n_migration_generator'

class I18nMigrationGeneratorTest < Rails::Generators::TestCase
  
  tests I18nMigrationGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :clean
  
  def clean
    FileUtils.rm_rf(self.destination_root)
  end
  
  test 'generated migration file' do
    run_generator %w(somethings)
    assert_migration 'db/migrate/create_somethings_i18n.rb'
  end
  
end