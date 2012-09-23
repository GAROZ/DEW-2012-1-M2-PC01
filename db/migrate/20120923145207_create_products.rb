class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id_product
      t.string :description
      t.integer :price
      t.string :client
      t.string :references

      t.timestamps
    end
  end
end
