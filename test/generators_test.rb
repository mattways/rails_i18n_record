require 'test_helper'
require 'rails/generators'
require 'generators/i18n_generator'

class I18nGeneratorTest < Rails::Generators::TestCase

  setup :clean
  
  tests I18nGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  
  test 'should exists' do
    run_generator %w(something)
    assert_file 'app/models/something_translation.rb'
    assert_migration 'db/migrate/create_somethings_i18n.rb'    
  end

  protected

  def clean
    FileUtils.rm_rf(self.destination_root)
  end
  
end
