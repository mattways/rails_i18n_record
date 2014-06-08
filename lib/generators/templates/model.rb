class <%= "#{class_name}Translation" %> < ActiveRecord::Base
  <% if Rails::VERSION::MAJOR < 4 %>

    attr_accessible :locale, <%= ":#{singular_table_name}_id" %>, <%= @model ? @model.translatable_attrs.map{ |a| ":#{a}" }.join(', ') : '' %>

  <% end %>
  belongs_to <%= ":#{table_name}" %>
 
  validates :locale, presence: true
  validates <%= ":#{singular_table_name}_id" %>, uniqueness: { scope: :locale }
 
end
