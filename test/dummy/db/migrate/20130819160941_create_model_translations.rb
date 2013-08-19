class CreateModelTranslations < ActiveRecord::Migration
  def change
    create_table :model_translations do |t|
      t.integer :model_id
      t.string :locale
      t.string :name

      t.timestamps 
    end
    add_index :model_translations, :model_id
    add_index :model_translations, :locale
  end
end
