module TranslatableRecords
  class Railtie < Rails::Railtie

    initializer 'translatable_records.active_record' do
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Base.include(
          TranslatableRecords::Extensions::ActiveRecord::Base
        )
      end
    end

  end
end
