class Scanning < ActiveRecord::Base
  attr_accessible :type, :searcher_id

  has_many :users
  belongs_to :searcher
  validates :type, presence: true

  extend Enumerize
  enumerize :type, in: [:actor, :model]
end
