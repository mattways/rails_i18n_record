module TranslatableRecords
  module ActiveRecord
    module Base
      extend ActiveSupport::Concern
      module ClassMethods

        def translatable?
          translatable_attrs.any?
        end

        def translatable_attrs
          @translatable_attrs ||= []
        end

        def attr_translatable(*args)
          make_translatable unless translatable?
          args.each do |name|
            define_translatable_attribute_methods name
            translatable_attrs << name
          end
        end

        protected

        def make_translatable
          include TranslatableRecords::ActiveRecord::Translatable
          default_scope -> { includes(:translations) }
          has_many :translations, class_name: "#{name}Translation", autosave: true, dependent: :destroy
          accepts_nested_attributes_for :translations
        end

        def define_translatable_attribute_methods(attr)
          %w(setter getter).each { |method| send "define_translatable_attribute_#{method}", attr }
        end

        def define_translatable_attribute_setter(attr)
          name = :"#{attr}="
          define_method name do |value|
            t = translation_by_locale(current_locale)
            t ? t.send(name, value) : translations.build(locale: current_locale.to_s, attr.to_sym => value)
          end
        end

        def define_translatable_attribute_getter(attr)
          %w(_was _changed?).unshift('').each do |suffix|
            name = :"#{attr}#{suffix}"
            define_method name do
              translation_by_locale(current_locale).try(name)
            end
          end
        end

      end
    end
  end
end
