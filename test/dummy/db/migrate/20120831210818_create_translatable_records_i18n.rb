class CreateTranslatableRecordsI18n < ActiveRecord::Migration
  def change 
    create_table :translatable_records_i18n do |t|    
      t.integer :translatable_record_id, :null => false
      t.string :locale, :null => false        
      t.string :name
      t.timestamps 
    end
    add_index :translatable_records_i18n, :translatable_record_id
    add_index :translatable_records_i18n, :locale
  end  
end