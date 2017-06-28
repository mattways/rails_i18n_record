class ProductTranslation < ApplicationRecord

  belongs_to :product

  validates_presence_of :locale
  validates_uniqueness_of :product_id, scope: :locale

end
