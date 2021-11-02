class User < ApplicationRecord
  before_save :cerate_voter_registration

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :cpf
  
  validate :document_validation
  validate :full_name
  validate :unique_cpf

  def cerate_voter_registration
    self.voter_registration = rand(10000...99999)
  end

  def document_validation
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf)
  end

  def unique_cpf
    errors.add(:cpf, :already_registered) if User.find_by(cpf: self.cpf).present?
  end

  def full_name
    namefull = self.name.split(' ')
    errors.add(:name, :not_full) if namefull.length < 2
  end
end