class Actor < ActiveRecord::Base
  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :middle_name,
                  :phone,
                  :user_id

  belongs_to :user

  validates :email, presence: true,
                    email: true,
                    uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :phone, presence: true
  validates :user_id, presence: true
end
