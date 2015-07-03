class ModelTranslation < ActiveRecord::Base

  belongs_to :models

  validates_presence_of :locale
  validates_uniqueness_of :model_id, scope: :locale

end
