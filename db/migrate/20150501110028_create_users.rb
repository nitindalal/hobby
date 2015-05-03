class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :role_cd

      t.timestamps
    end
  end
end
