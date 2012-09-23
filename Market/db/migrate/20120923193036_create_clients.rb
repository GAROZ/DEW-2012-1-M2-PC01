class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.string :card_number

      t.timestamps
    end
  end
end
