class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def university
    doctors.select(:university).distinct
  end
end
