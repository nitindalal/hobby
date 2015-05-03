class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.float :volume
      t.float :weight

      t.timestamps
    end
  end
end
