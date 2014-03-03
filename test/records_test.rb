require 'test_helper'

class RecrodsTest < ActiveSupport::TestCase

  test "should create associated translation" do
    assert_equal 'name', record.name
  end

  test "should edit associated translation" do
    record.update name: 'new name'
    assert_equal 'new name', record.name
  end

  test "should delete associated translation" do
    record.destroy
    assert_nil ModelTranslation.find_by_model_id(record.id)
  end

  test "should change locales" do
    record.with_locale :es
    assert_nil record.name
    record.update name: 'new name'
    assert_equal 'new name', record.name
    record.with_locale :en
    assert_equal 'name', record.name
  end

  private

  def record
    @record ||= Model.create(name: 'name') 
  end

end
