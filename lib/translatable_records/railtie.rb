module TranslatableRecords
  class Railtie < Rails::Railtie

    initializer :translatable_records do
      ::ActiveRecord::Base.include(
        TranslatableRecords::Extensions::ActiveRecord::Base
      )
    end

  end
end
