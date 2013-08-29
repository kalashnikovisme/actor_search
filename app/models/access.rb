class Access < ActiveRecord::Base
  attr_accessible :user_id, :searcher_id

  has_one :user
  has_one :searcher

  validates :user_id, presence: true
  validates :searcher_id, presence: true
end
