class CreateModelsI18n < ActiveRecord::Migration
  def change 
    create_table :models_i18n do |t|    
      t.integer :model_id, :null => false
      t.string :locale, :null => false        
      t.string :name
      t.timestamps 
    end
    add_index :models_i18n, :model_id
    add_index :models_i18n, :locale
  end  
end
