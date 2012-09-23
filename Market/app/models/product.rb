class Product < ActiveRecord::Base
  attr_accessible :client, :description, :id_product, :price, :references
end
