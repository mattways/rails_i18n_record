class ModelTranslation < ActiveRecord::Base
  
  attr_accessible :locale, :model_id, :name if Rails::VERSION::MAJOR < 4
 
  belongs_to :models
 
  validates :locale, presence: true
  validates :model_id, uniqueness: { scope: :locale }
 
end
