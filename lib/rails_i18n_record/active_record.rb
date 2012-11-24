module RailsI18nRecord
  module ActiveRecord
    module NonTranslatableMethods
      
      def translatable?
        not defined?(@translatable_atrrs).nil?
      end
    
      def attr_translatable(*args)
        make_translatable unless translatable?
        args.each { |name| define_translatable_attribute_methods(name) }
      end 

      protected

      def make_translatable
        send :include, RailsI18nRecord::ActiveRecord::TranslatableMethods
        default_scope :include => :translations
        attr_accessible :translations_attributes
        has_many :translations, :class_name => "#{name}Translation", :autosave => true, :dependent => :destroy    
        accepts_nested_attributes_for :translations                                        
        @translatable_atrrs = []                  
      end

      def define_translatable_attribute_methods(name)
        ['set', 'get', 'was'].each do |method|
          send "define_translatable_attribute_method_#{method}", name
        end
      end

      def define_translatable_attribute_method_set(name)
        define_method "#{name}=" do |value|  
          t = translation_by_locale(current_locale)
          t ? t.send("#{name}=".to_sym, value) : translations.build(:locale => current_locale.to_s, name.to_sym => value)        
        end        
      end

      def define_translatable_attribute_method_get(name)
        define_method "#{name}" do
          t = translation_by_locale(current_locale)
          t ? t.send("#{name}".to_sym) : nil
        end           
      end

      def define_translatable_attribute_method_was(name)
        define_method "#{name}_was" do          
          t = translation_by_locale(current_locale)
          t ? t.send("#{name}_was".to_sym) : nil     
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
        defined?(@locale).nil? ? I18n.locale.to_s : @locale
      end
      
      def translation_by_locale(locale)
        t = translations.find { |t| t.locale == locale.to_s }
        t ? t : translations.find_by_locale(locale)
      end
      
    end
  end
end

ActiveRecord::Base.send :extend, RailsI18nRecord::ActiveRecord::NonTranslatableMethods
