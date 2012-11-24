class RecordTranslation < ActiveRecord::Base
  
  self.table_name = :records_i18n
  
  attr_accessible :locale, :record_id, :name
  
  belongs_to :recordss
  
  validates :locale, :presence => true    
  validates :locale, :inclusion => { :in => I18n.available_locales.map{|l|l.to_s} }
  validates :record_id, :uniqueness => { :scope => :locale }
  
end
