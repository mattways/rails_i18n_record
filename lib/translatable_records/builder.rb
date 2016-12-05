module TranslatableRecords
  class Builder

    attr_reader :model, :concern

    def initialize(model)
      @model = model
      @concern = Module.new
    end

    def define(attributes)
      model.include Concern
      ensure_association
      attributes.each do |attribute|
        define_writer attribute
        define_readers attribute
      end
      model.translations ||= attributes
      model.include concern
    end

    private

    def ensure_association
      unless model.reflections.has_key?(:translations)
        model.has_many(
          :translations,
          class_name: "#{model.name}Translation",
          dependent: :destroy
        )
        model.accepts_nested_attributes_for :translations
      end
    end

    def define_writer(attribute)
      name = "#{attribute}="
      concern.class_eval do
        define_method name do |value|
          if translation = find_translation(locale)
            translation.send name, value
          else
            translations.build(locale: locale, attribute => value)
          end
        end
      end
    end

    def define_readers(attribute)
      names = [
        attribute,
        "#{attribute}_was",
        "#{attribute}_changed?",
        "#{attribute}_before_type_cast",
        "#{attribute}_came_from_user?"
      ]
      concern.class_eval do
        names.each do |name|
          define_method name do
            find_translation(locale).try name
          end
        end
      end
    end

  end
end
