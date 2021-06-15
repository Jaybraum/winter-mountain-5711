class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  def self.age_order
    select('patients.*')
    .order(age: :desc)
  end
end
