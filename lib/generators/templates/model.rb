class <%= "#{class_name}Translation" %> < ActiveRecord::Base
 
  belongs_to <%= ":#{singular_table_name}" %>
 
  validates :locale, presence: true
  validates <%= ":#{singular_table_name}_id" %>, uniqueness: { scope: :locale }
 
end
