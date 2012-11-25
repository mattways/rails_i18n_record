require 'test_helper'

class RailsI18nRecordTest < ActiveSupport::TestCase
  
  setup :create_record

  test 'truth' do
    assert_kind_of Module, RailsI18nRecord
  end
  
  test 'should create associated translation' do
    assert_equal @record.name, 'name'
  end

  test 'should edit associated translation' do
    @record.update_attributes :name => 'new name'
    assert_equal @record.name, 'new name'
  end

  test 'should delete associated translation' do
    @record.destroy
    assert_equal RecordTranslation.find_by_record_id(@record.id), nil
  end

  protected

  def create_record
    @record = Record.create(:name => 'name') 
  end

end
