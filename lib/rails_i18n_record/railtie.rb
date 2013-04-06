module RailsI18nRecord
  class Railtie < Rails::Railtie

    initializer 'rails_i18n_record' do
      ::ActiveRecord::Base.send :extend, RailsI18nRecord::ActiveRecord::Base::NonTranslatable
    end

  end
end
