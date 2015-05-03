class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :source_type
      t.integer :source_id
      t.string :destination_type
      t.integer :destination_id
      t.datetime :preferred_time
      t.integer :user_id

      t.timestamps
    end
  end
end
