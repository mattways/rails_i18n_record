class Create<%= class_name %>Translations < ActiveRecord::Migration
  def change
    create_table :<%= singular_table_name %>_translations do |t|
      t.integer :<%= singular_table_name %>_id
      t.string :locale

      t.timestamps null: false
    end
    add_index :<%= singular_table_name %>_translations, [:<%= singular_table_name %>_id, :locale], unique: true
  end
end
