require 'test_helper'
require 'rails/generators'
require 'generators/translation/translation_generator'

class GeneratorsTest < ::Rails::Generators::TestCase
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'install' do
    self.class.tests TranslatableRecords::Generators::TranslationGenerator
    run_generator %w(product)
    assert_file 'app/models/product_translation.rb'
    assert_migration 'db/migrate/create_product_translations.rb'
    migration = File.read(migration_file_name('db/migrate/create_product_translations.rb'))
    assert_includes migration, 't.string :name'
  end

end
