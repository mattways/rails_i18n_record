class CreateTranslatableRecords < ActiveRecord::Migration
  def change
    create_table :translatable_records do |t|

      t.timestamps
    end
  end
end
