class Access < ActiveRecord::Base
  attr_accessible :user_id, :searcher_id, :state

  has_one :user
  has_one :searcher

  validates :user_id, presence: true
  validates :searcher_id, presence: true

  state_machine :state, initial: :denied do
    state :denied
    state :granted

    event :grant do
      transition denied: :granted
    end

    event :denie do
      transition granted: :denied
    end
  end
end
