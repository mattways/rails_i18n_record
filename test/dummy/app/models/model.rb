class Model < ActiveRecord::Base
  attr_accessible :name
  attr_translatable :name
end
