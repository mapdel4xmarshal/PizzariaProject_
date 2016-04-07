class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :Size
      t.string :Crust
      t.string :Toppings
      t.string :Price
      t.integer :Quantity

      t.timestamps null: false
    end
  end
end
