require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'persistent' do
    product = Product.new

    assert_nil product.name
    product.name = 'phone'
    assert_equal 'phone', product.name
    assert_equal 'en', product.locale

    product.locale = :es
    assert_nil product.name
    product.name = 'teléfono'
    assert_equal 'teléfono', product.name
    assert_equal 'es', product.locale

    product.locale = :en
    assert_equal 'phone', product.name
    assert_equal 'en', product.locale

    product.save!
    product.reload

    assert_equal 'phone', product.name
    assert_equal 'en', product.locale

    product.locale = :es
    assert_equal 'teléfono', product.name
    assert_equal 'es', product.locale

    product.destroy!

    assert_equal 0, ProductTranslation.count
  end

end
