require 'test_helper'

class RecordsTest < ActiveSupport::TestCase

  test "create associated translation" do
    assert_equal 'name', record.name
  end

  test "edit associated translation" do
    record.name = 'new name'
    record.save!
    assert_equal 'new name', record.name
  end

  test "delete associated translation" do
    record.destroy
    assert_nil ModelTranslation.find_by_model_id(record.id)
  end

  test "change locales" do
    record.with_locale :es
    assert_nil record.name
    record.name = 'new name'
    record.save!
    assert_equal 'new name', record.name
    record.with_locale :en
    assert_equal 'name', record.name
  end

  private

  def record
    @record ||= Model.create(name: 'name')
  end

end
