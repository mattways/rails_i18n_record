module Rails
  module I18n
    module Record
      class Railtie < Rails::Railtie

        initializer 'i18n.record.methods' do
          ::ActiveRecord::Base.send :extend, Rails::I18n::Record::Base::NonTranslatable
        end

      end
    end
  end
end
