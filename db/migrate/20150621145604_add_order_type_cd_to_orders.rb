class AddOrderTypeCdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_type_cd, :integer
  end
end
