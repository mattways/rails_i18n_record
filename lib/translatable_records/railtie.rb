module TranslatableRecords
  class Railtie < Rails::Railtie

    initializer 'translatable_records' do
      ::ActiveRecord::Base.send :include, TranslatableRecords::ActiveRecord::Base
    end

  end
end
