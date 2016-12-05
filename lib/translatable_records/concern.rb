module TranslatableRecords
  module Concern
    extend ActiveSupport::Concern

    def locale=(value)
      if value.present?
        @locale = value.to_s
      else
        @locale = nil
      end
    end

    def locale
      @locale || I18n.locale.to_s
    end

    def find_translation(locale)
      translations.to_a.group_by(&:locale)[locale.to_s].try :first
    end

  end
end
