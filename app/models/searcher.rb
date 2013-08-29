class Searcher < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :accesses, dependent: :destroy

  validates :user_id, presence: true
end
