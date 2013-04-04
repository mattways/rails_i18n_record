class ModelTranslation < ActiveRecord::Base
  
  self.table_name = :models_i18n
  
  attr_accessible :locale, :model_id, :name
  
  belongs_to :models
  
  validates :locale, :presence => true    
  validates :locale, :inclusion => { :in => I18n.available_locales.map{|l|l.to_s} }
  validates :model_id, :uniqueness => { :scope => :locale }  
  
end