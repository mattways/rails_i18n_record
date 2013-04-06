module RailsI18nRecord
  module ActiveRecord
    module Base
      module NonTranslatable
        
        def translatable?
          not defined?(@translatable_attrs).nil?
        end
      
        def attr_translatable(*args)
          make_translatable unless translatable?
          args.each do |name| 
            define_translatable_attribute_methods(name)
            @translatable_attrs << name
          end
        end 

        protected

        def make_translatable
          send :include, RailsI18nRecord::ActiveRecord::Base::Translatable
          default_scope :include => :translations
          attr_accessible :translations_attributes
          has_many :translations, :class_name => "#{name}Translation", :autosave => true, :dependent => :destroy    
          accepts_nested_attributes_for :translations                                        
          @translatable_attrs = []                  
        end

        def define_translatable_attribute_methods(attr)
          ['set', 'get'].each do |method|
            send "define_translatable_attribute_method_#{method}", attr
          end
        end

        def define_translatable_attribute_method_set(attr)
          define_method "#{attr}=" do |value|  
            t = translation_by_locale(current_locale)
            t ? t.send("#{attr}=".to_sym, value) : translations.build(:locale => current_locale.to_s, attr.to_sym => value)        
          end        
        end

        def define_translatable_attribute_method_get(attr)
          ['', '_was', '_changed?'].each do |suffix|
            define_method "#{attr}#{suffix}" do
              t = translation_by_locale(current_locale)
              t ? t.send("#{attr}#{suffix}".to_sym) : nil
            end           
          end
        end

      end    
      module Translatable
        
        def with_locale(locale)
          @locale = locale
        end
        
        def build_translations
          I18n.available_locales.each do |locale| 
            t = translations.find_by_locale(locale)
            translations.build :locale => locale.to_s unless t
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
end
