class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :boolean
    add_column :orders, :FirstName, :string
    add_column :orders, :LastName, :string
  end
end
