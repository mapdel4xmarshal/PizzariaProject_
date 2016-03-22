class AddMoreFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :Address, :string
    add_column :orders, :City, :string
    add_column :orders, :Location, :string
    add_column :orders, :Postalcode, :string
    add_column :orders, :Phone, :string
  end
end
