require 'test_helper'
require 'rails/generators'
require 'generators/i18n_model_generator'

class I18nModelGeneratorTest < Rails::Generators::TestCase
  
  tests I18nModelGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :clean
  
  def clean
    FileUtils.rm_rf(self.destination_root)
  end
  
  test 'generated model file' do
    run_generator %w(something)
    assert_file 'app/models/something_translation.rb'
  end
  
end