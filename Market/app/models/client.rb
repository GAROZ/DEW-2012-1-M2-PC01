class Client < ActiveRecord::Base
  attr_accessible :card_number, :lastname, :name
end
