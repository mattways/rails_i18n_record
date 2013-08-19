module TranslatableRecords
  module ActiveRecord
    module Translatable
      extend ActiveSupport::Concern
      
      def with_locale(locale)
        @locale = locale
      end
      
      def build_translations
        I18n.available_locales.each do |locale| 
          t = translations.find_by_locale(locale)
          translations.build locale: locale.to_s unless t
        end
      end   
      
      protected
      
      def current_locale
        defined?(@locale).nil? ? I18n.locale.to_s : @locale
      end
      
      def translation_by_locale(locale)
        t = translations.find { |t| t.locale == locale.to_s }
        t ? t : translations.find_by_locale(locale)
      end
      
    end
  end
end
