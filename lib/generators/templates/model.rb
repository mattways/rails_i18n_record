class <%= "#{class_name}Translation" %> < ActiveRecord::Base
 
  belongs_to <%= ":#{singular_table_name}" %>
 
  validates_presence_of :locale
  validates_uniqueness_of <%= ":#{singular_table_name}_id" %>, scope: :locale
 
end
