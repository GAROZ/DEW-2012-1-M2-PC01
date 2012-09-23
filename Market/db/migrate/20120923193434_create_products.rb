class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :description
      t.integer :price
      t.references :client

      t.timestamps
    end
    add_index :products, :client_id
  end
end
