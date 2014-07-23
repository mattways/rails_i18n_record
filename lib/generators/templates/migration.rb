class <%= "Create#{singular_name.camelize}Translations" %> < ActiveRecord::Migration
  def change
    create_table <%= ":#{singular_table_name}_translations" %> do |t|
      t.integer <%= ":#{singular_table_name}_id" %>
      t.string :locale

      t.timestamps
    end
    add_index <%= ":#{singular_table_name}_translations" %>, <%= ":#{singular_table_name}_id" %>
    add_index <%= ":#{singular_table_name}_translations" %>, :locale
  end
end
