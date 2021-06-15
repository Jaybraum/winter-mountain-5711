require 'rails_helper'

RSpec.describe 'hospital show page' do
  before(:each) do
    @hospital = Hospital.create!(name: 'Saint Elsewhere')

    @doc_1 = @hospital.doctors.create!(name: 'Dr. Jay', specialty: 'Surgeon', university:'Harvard')
    @doc_2 = @hospital.doctors.create!(name: 'Dr. Kay', specialty: 'Pediatrician', university:'Yale')
    @doc_3 = @hospital.doctors.create!(name: 'Dr. Yao', specialty: 'Eye', university:'Stanford')
    @doc_3 = @hospital.doctors.create!(name: 'Dr. Ray', specialty: 'Ear', university:'Stanford')

    @pat_1 = Patient.create!(name: 'Jeff', age: 31)
    @pat_2 = Patient.create!(name: 'Ana', age: 27)
    @pat_3 = Patient.create!(name: 'Gary', age: 18)

    @pat_4 = Patient.create!(name: 'Jess', age: 52)

    Appointment.create!(doctor:@doc_1, patient: @pat_1)
    Appointment.create!(doctor:@doc_1, patient: @pat_2)
    Appointment.create!(doctor:@doc_1, patient: @pat_3)

    Appointment.create!(doctor:@doc_2, patient: @pat_4)
  end

  it 'displays the hospitals name' do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content(@hospital.name)
  end

  it 'displays the number of doctors working at the hospital' do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content('Total Doctors on call: 4')
  end

  it 'displays a list of universities attended' do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content('Harvard')
    expect(page).to have_content('Yale')
    expect(page).to have_content('Stanford')
  end
end
