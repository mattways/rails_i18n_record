module TranslatableRecords
  module ActiveRecord
    module Translatable
      extend ActiveSupport::Concern
 
      def with_locale(locale)
        @current_locale = locale.to_sym
      end
 
      def build_translations
        I18n.available_locales.each { |locale| translations.build locale: locale.to_s unless translations.find_by_locale(locale) }
      end   
 
      protected
 
      def current_locale
        @current_locale || I18n.locale
      end
 
      def translation_by_locale(locale)
        translations.find { |t| t.locale == locale.to_s } || translations.find_by_locale(locale)
      end
 
    end
  end
end
