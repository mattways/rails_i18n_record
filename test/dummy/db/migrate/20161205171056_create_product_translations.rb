class CreateProductTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_translations do |t|
      t.integer :product_id
      t.string :locale
      t.string :name

      t.timestamps null: false
    end
    add_index :product_translations, [:product_id, :locale], unique: true
  end
end
