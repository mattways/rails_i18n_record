class TranslatableRecordTranslation < ActiveRecord::Base
  
  self.table_name = :translatable_records_i18n
  
  attr_accessible :locale, :translatable_record_id, :name
  
  belongs_to :translatable_records
  
  validates :locale, :presence => true    
  validates :locale, :inclusion => { :in => I18n.available_locales.map{|l|l.to_s} }
  validates :translatable_record_id, :uniqueness => { :scope => :locale }
  
end