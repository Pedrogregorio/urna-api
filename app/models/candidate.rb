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

  validate :full_name
  validate :unique_code
  validate :validate_code

  def unique_code
    errors.add(:code, :already_registered) if Candidate.find_by(code: self.code).present?
  end

  def validate_code
    case self.category
    when "president"
      errors.add(:code, :invalid) unless self.code.length == 2
    when "governor"
      errors.add(:code, :invalid) unless self.code.length == 2
    when "senator"
      errors.add(:code, :invalid) unless self.code.length == 3
    when "congressman"
      errors.add(:code, :invalid) unless self.code.length == 4
    when "state_deputy"
      errors.add(:code, :invalid) unless self.code.length == 5
    when "mayor"
      errors.add(:code, :invalid) unless self.code.length == 2
    else
      errors.add(:category, :invalid)
    end    
  end

  def full_name
    namefull = self.name.split(' ')
    errors.add(:name, :not_full) if namefull.length < 2
  end
end
