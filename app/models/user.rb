class User < ActiveRecord::Base
  attr_accessible :login,
                  :password,
                  :email,
                  :first_name,
                  :middle_name,
                  :last_name,
                  :phone

  has_one :actor, dependent: :destroy
  has_one :model, dependent: :destroy

  validates :login, presence: true,
                    length: { maximum: 8 }
  validates :password, presence: true,
                       length: { minumum: 8, maximum: 16 }

  validates :email, presence: true,
                    email: true,
                    uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :phone, presence: true
end
