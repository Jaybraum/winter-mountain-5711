require 'rails_helper'

RSpec.describe Patient, type: :model do
    it {should have_many(:appointments)}
    it {should have_many(:doctors).through(:appointments)}
  end

  before(:each) do
    @pat_1 = Patient.create!(name: 'Jeff', age: 31)
    @pat_2 = Patient.create!(name: 'Ana', age: 27)
    @pat_3 = Patient.create!(name: 'Gary', age: 18)
    @pat_4 = Patient.create!(name: 'Jess', age: 52)
  end

  describe 'class methods' do
    it '::age_order' do

      expect(Patient.age_order.first).to be(@pat_1)
      expect(Patient.age_order.last).to be(@pat_3)
    end
  end
end
