require 'test_helper'
require 'rails/generators'
require 'generators/translation_generator'

class I18nGeneratorTest < Rails::Generators::TestCase

  setup do
    FileUtils.rm_rf(self.destination_root)
  end
  
  tests TranslationGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  
  test "should exists" do
    run_generator %w(model)
    assert_file 'app/models/model_translation.rb'
    assert_migration 'db/migrate/create_model_translations.rb'    
  end
  
end
