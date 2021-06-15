class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  def self.age_order
    select('patients.*')
    .order(age: :desc)
  end
end
