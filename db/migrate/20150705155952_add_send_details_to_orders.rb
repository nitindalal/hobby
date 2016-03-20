class AddSendDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :send_details, :boolean
    add_column :orders, :final_pick_confirmation, :boolean
    add_column :orders, :complete_delivery_confirmation, :boolean
  end
end
