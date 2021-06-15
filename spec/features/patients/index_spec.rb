require 'rails_helper'

RSpec.describe 'Patients index page' do
  before(:each) do
    @hospital = Hospital.create!(name: 'Saint Elsewhere')

    @doc_1 = @hospital.doctors.create!(name: 'Dr. Jay', specialty: 'Surgeon', university:'Harvard')
    @doc_2 = @hospital.doctors.create!(name: 'Dr. Kay', specialty: 'Pediatrician', university:'Yale')

    @pat_1 = Patient.create!(name: 'Jeff', age: 31)
    @pat_2 = Patient.create!(name: 'Ana', age: 27)
    @pat_3 = Patient.create!(name: 'Gary', age: 18)

    @pat_4 = Patient.create!(name: 'Jess', age: 52)

    Appointment.create!(doctor:@doc_1, patient: @pat_1)
    Appointment.create!(doctor:@doc_1, patient: @pat_2)
    Appointment.create!(doctor:@doc_1, patient: @pat_3)

    Appointment.create!(doctor:@doc_2, patient: @pat_4)
  end

  it 'displays all the patients names oldest to youngest' do
    visit '/patients'

    expect(page.all(".patient")[0].text).to eq(@pat_4.name)
    expect(page.all(".patient")[1].text).to eq(@pat_1.name)
    expect(page.all(".patient")[2].text).to eq(@pat_2.name)
    expect(page.all(".patient")[3].text).to eq(@pat_3.name)
  end
end
