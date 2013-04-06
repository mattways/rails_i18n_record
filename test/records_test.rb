require 'test_helper'

class RecrodsTest < ActiveSupport::TestCase

  setup :create_record

  test "should create associated translation" do
    assert_equal @record.name, 'name'
  end

  test "should edit associated translation" do
    @record.update_attributes :name => 'new name'
    assert_equal @record.name, 'new name'
  end

  test "should delete associated translation" do
    @record.destroy
    assert_equal ModelTranslation.find_by_model_id(@record.id), nil
  end

  protected

  def create_record
    @record = Model.create(:name => 'name') 
  end

end
