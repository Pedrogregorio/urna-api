class Candidate < ApplicationRecord
  extend Enumerize

  enumerize :category, in: {
    president: 0,
    governor: 1,
    senator: 2,
    congressman: 3,
    state_deputy: 4,
    mayor: 5
  }

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :category
  validates_presence_of :city
  validates_presence_of :state
end
