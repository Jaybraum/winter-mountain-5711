require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
    it {should have_many(:patients).through(:doctors)}
  end

  before(:each) do
    @hospital = Hospital.create!(name: 'Saint Elsewhere')

    @doc_1 = @hospital.doctors.create!(name: 'Dr. Jay', specialty: 'Surgeon', university:'Harvard')
    @doc_2 = @hospital.doctors.create!(name: 'Dr. Kay', specialty: 'Pediatrician', university:'Yale')
    @doc_3 = @hospital.doctors.create!(name: 'Dr. Yao', specialty: 'Eye', university:'Stanford')
    @doc_4 = @hospital.doctors.create!(name: 'Dr. Ray', specialty: 'Ear', university:'Stanford')
  end

  describe 'instance methods' do
    it '#university' do

      expect(@hospital.university.count).to be(3)
    end
  end
end
