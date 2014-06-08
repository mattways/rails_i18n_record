class Model < ActiveRecord::Base
  attr_accessible :name if Rails::VERSION::MAJOR < 4
  attr_translatable :name
end
