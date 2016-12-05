class ProductTranslation < ActiveRecord::Base

  belongs_to :product

  validates_presence_of :locale, :name
  validates_uniqueness_of :product_id, scope: :locale

end
