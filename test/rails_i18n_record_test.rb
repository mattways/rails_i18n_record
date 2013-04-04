require 'test_helper'

class RailsI18nRecordTest < ActiveSupport::TestCase

  test 'truth' do
    assert_kind_of Module, Rails::I18n::Record
  end

end
