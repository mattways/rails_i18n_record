module RailsI18nRecord
  module ActiveRecord
    module NonTranslatableMethods
      
      def translatable?
        @translatable == true
      end
      
      def translatable_attrs
        @translatable_atrrs ||= []
      end
    
      def attr_translatable(*args)
        unless translatable?    
          send :include, RailsI18nRecord::ActiveRecord::TranslatableMethods
          attr_accessible :translations_attributes
          has_many :translations, :class_name => translation_class, :autosave => true, :dependent => :destroy                 
          accepts_nested_attributes_for :translations
          default_scope :include => :translations            
          after_create :late_translations
          after_save :late_translations                      
          @translatable_atrrs = []               
          @translatable = true      
        end
        args.each do |arg|
          @translatable_atrrs << arg
          define_method "#{arg}=" do |value|          
            t = translation_by_locale(current_locale)
            t ? t.send("#{arg}=".to_sym, value) : translate_late(current_locale, arg.to_sym => value)        
          end        
          define_method "#{arg}" do
            t = translation_by_locale(current_locale)
            t ? t.send(arg.to_sym) : ''      
          end                 
        end         
      end  
      
      def translation_class
        "#{name}Translation"
      end
    
      def translation_fk
        "#{table_name.singularize}_id"
      end      
      
    end    
    module TranslatableMethods
      
      def with_locale(locale)
        @locale = locale
      end
      
      def translation_by_locale(locale)
        translations.find{|t| t[:locale] == locale.to_s}
      end
      
      def build_translations
        I18n.available_locales.each do |locale| 
          t = translation_by_locale(locale)
          translations.build :locale => locale.to_s unless t
        end
      end      
      
      protected
      
      def current_locale
        defined?(@locale) ? @locale : I18n.locale
      end

      def late_translations
        if @translate_late.is_a?(Hash)
          @translate_late.each do |locale, params|
            t = translation_by_locale(locale)
            t ? t.update_attributes(params) : translations.create(params.merge(:locale => locale.to_s))
          end
          @translate_late.clear
        end
      end    

      def translate_late(locale, fields)
        if @translate_late.is_a?(Hash)
          if @translate_late[locale].is_a?(Hash)
            @translate_late[locale].merge! fields
          else
            @translate_late[locale] = fields
          end        
        else
          @translate_late = {locale => fields}        
        end
      end
      
    end
  end
end

ActiveRecord::Base.send :extend, RailsI18nRecord::ActiveRecord::NonTranslatableMethods