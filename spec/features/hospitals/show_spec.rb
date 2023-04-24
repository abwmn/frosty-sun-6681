require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  describe 'when I visit a hospital show page' do
    it 'displays hospital name, names of all doctors, and doctor patient counts' do

    hospital = Hospital.create!(name: 'GU Hospital')

    doctor1 = hospital.doctors.create!(name: 'Alice')
    doctor2 = hospital.doctors.create!(name: 'Bob')
    patient1 = doctor2.patients.create!
    patient2 = doctor2.patients.create!
    patient3 = doctor2.patients.create!
    patient4 = doctor1.patients.create!

    visit hospital_path(hospital)

    expect(page).to have_content("#{hospital.name}'s Show Page")

    within('#doctors') do
      expect(page).to have_content("Doctor: #{doctor1.name} Number of Patients: 1")
      expect(page).to have_content("Doctor: #{doctor2.name} Number of Patients: 3")
    end

    expect(doctor2.name).to appear_before(doctor1.name)
    end
  end
end