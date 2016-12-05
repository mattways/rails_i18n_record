require 'test_helper'
require 'rails/generators'
require 'generators/translation_generator'

class GeneratorsTest < ::Rails::Generators::TestCase
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'install' do
    self.class.tests TranslationGenerator
    run_generator %w(product)
    assert_file 'app/models/product_translation.rb'
    assert_migration 'db/migrate/create_product_translations.rb'
  end

end
