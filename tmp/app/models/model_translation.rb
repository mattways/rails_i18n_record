class ModelTranslation < ActiveRecord::Base

  
  
  belongs_to :models
  
  validates :locale, presence: true    
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }
  validates :model_id, uniqueness: { scope: :locale }  
  
end
