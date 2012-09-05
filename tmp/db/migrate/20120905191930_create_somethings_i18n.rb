class CreateSomethingsI18n < ActiveRecord::Migration
  def change 
    create_table :somethings_i18n do |t|    
      t.integer :something_id, :null => false
      t.string :locale, :null => false        
      
      t.timestamps 
    end
    add_index :somethings_i18n, :something_id
    add_index :somethings_i18n, :locale
    
    add_index :somethings_i18n, :created_at
    add_index :somethings_i18n, :updated_at    
  end  
end