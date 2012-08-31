require 'test_helper'

class RailsI18nRecordTest < ActiveSupport::TestCase
  
  test 'truth' do
    assert_kind_of Module, RailsI18nRecord
  end
  
  test 'route' do
    assert_equal TranslatableRecord.create(:name => 'prueba').name.to_s, 'prueba'
  end  
  
end