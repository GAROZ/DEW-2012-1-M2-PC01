class Product < ActiveRecord::Base
  belongs_to :client
  attr_accessible :code, :description, :price, :client_id
end
