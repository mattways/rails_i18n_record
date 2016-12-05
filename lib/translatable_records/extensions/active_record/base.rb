module TranslatableRecords
  module Extensions
    module ActiveRecord
      module Base
        extend ActiveSupport::Concern

        module ClassMethods

          def translatable?
            translations.any?
          end

          def translations
            @translations ||= []
          end

          def translate(*attributes)
            builder = Builder.new(self)
            builder.define attributes
          end

        end
      end
    end
  end
end
