class User < ActiveRecord::Base
  attr_accessible :login, :password

  has_one :actor, dependent: :destroy
  has_one :model, dependent: :destroy

  validates :login, presence: true,
                    length: { maximum: 8 }
  validates :password, presence: true,
                       length: { minumum: 8, maximum: 16 }
end
