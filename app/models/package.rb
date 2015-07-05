class Package < ActiveRecord::Base
  attr_accessible :volume, :weight, :order, :order_id

  belongs_to :user
  belongs_to :order
end
