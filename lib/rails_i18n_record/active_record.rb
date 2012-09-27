module RailsI18nRecord
  module ActiveRecord
    module NonTranslatableMethods
      
      def translatable?
        (defined?(@translatable_atrrs) and @translatable_atrrs.any?)
      end
    
      def attr_translatable(*args)
        unless translatable?     
          send :include, RailsI18nRecord::ActiveRecord::TranslatableMethods
          default_scope :include => :translations
          attr_accessible :translations_attributes
          has_many :translations, :class_name => "#{name}Translation", :autosave => true, :dependent => :destroy    
          accepts_nested_attributes_for :translations                                        
          @translatable_atrrs = []                  
        end
        args.each do |arg|
          @translatable_atrrs << arg
          define_method "#{arg}=" do |value|     
            t = translation_by_locale(current_locale)
            t ? t.send("#{arg}=".to_sym, value) : translations.build(:locale => current_locale, arg.to_sym => value)        
          end        
          define_method "#{arg}" do
            t = translation_by_locale(current_locale)
            t ? t.send("#{arg}".to_sym) : nil             
          end           
          define_method "#{arg}_was" do          
            t = translation_by_locale(current_locale)
            t ? t.send("#{arg}_was".to_sym) : nil     
          end                
        end         
      end       
      
    end    
    module TranslatableMethods
      
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
        defined?(@locale) ? @locale : I18n.locale
      end
      
      def translation_by_locale(locale)
        t = translations.find { |t| t.locale == locale.to_s }
        t ? t : translations.find_by_locale(locale)
      end
      
    end
  end
end

ActiveRecord::Base.send :extend, RailsI18nRecord::ActiveRecord::NonTranslatableMethods
