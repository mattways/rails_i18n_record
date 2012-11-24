class CreateRecordsI18n < ActiveRecord::Migration
  def change 
    create_table :records_i18n do |t|    
      t.integer :record_id, :null => false
      t.string :locale, :null => false        
      t.string :name
      t.timestamps 
    end
    add_index :records_i18n, :record_id
    add_index :records_i18n, :locale
  end  
end
