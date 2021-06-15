require 'rails_helper'

RSpec.describe 'doctors show page' do
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

  it 'displays only the doctors name and its attributes' do
    visit "/doctors/#{@doc_1.id}"

    expect(page).to have_content(@doc_1.name)
    expect(page).to have_content(@doc_1.specialty)
    expect(page).to have_content(@doc_1.university)

    expect(page).to_not have_content(@doc_2.name)
  end

  it 'displays the name of the hospital the doctor is in' do
    visit "/doctors/#{@doc_1.id}"

    expect(page).to have_content('Saint Elsewhere')
  end

  it 'lists all the patients this doctor has by name' do
    visit "/doctors/#{@doc_1.id}"

    expect(page).to have_content(@pat_1.name)
    expect(page).to have_content(@pat_2.name)
    expect(page).to have_content(@pat_3.name)

    expect(page).to_not have_content(@pat_4.name)
  end
end
