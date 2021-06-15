# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

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
