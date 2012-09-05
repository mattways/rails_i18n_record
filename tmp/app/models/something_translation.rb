class SomethingTranslation < ActiveRecord::Base
  
  self.table_name = :somethings_i18n
  
  attr_accessible :locale, :something_id, 
  
  belongs_to :somethings
  
  validates :locale, :presence => true    
  validates :locale, :inclusion => { :in => I18n.available_locales.map{|l|l.to_s} }
  validates :something_id, :uniqueness => { :scope => :locale }  
  
end