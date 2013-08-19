require 'test_helper'

class RecrodsTest < ActiveSupport::TestCase

  setup do
    @record = Model.create(name: 'name') 
  end

  test "should create associated translation" do
    assert_equal @record.name, 'name'
  end

  test "should edit associated translation" do
    @record.update_attributes name: 'new name'
    assert_equal @record.name, 'new name'
  end

  test "should delete associated translation" do
    @record.destroy
    assert_equal ModelTranslation.find_by_model_id(@record.id), nil
  end

end
