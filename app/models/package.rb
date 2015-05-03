class Package < ActiveRecord::Base
  attr_accessible :volume, :weight

  belongs_to :user
end
