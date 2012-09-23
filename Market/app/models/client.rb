class Client < ActiveRecord::Base
  has_many :products	
  attr_accessible :card_number, :lastname, :name
end
