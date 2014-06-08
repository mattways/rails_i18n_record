class ModelTranslation < ActiveRecord::Base
 
  belongs_to :models
 
  validates :locale, presence: true
  validates :model_id, uniqueness: { scope: :locale }
 
end
