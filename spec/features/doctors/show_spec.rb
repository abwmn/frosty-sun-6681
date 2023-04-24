require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  describe 'when I visit a doctor show page' do
    before(:all) do
      @hospital = Hospital.create!(name: 'GU Hospital')
      @doctor = @hospital.doctors.create!(name: 'Bob', university: 'Georgetown', specialty: 'ENT')
      @patient1 = @doctor.patients.create!(name: 'Sue', age: 20)
      @patient2 = @doctor.patients.create!(name: 'Bill', age: 21)
    end

    it 'US1: I see all their info and patients' do
      visit doctor_path(@doctor)

      within('#info') do
        expect(page).to have_content(@doctor.name)
        expect(page).to have_content(@doctor.specialty)
        expect(page).to have_content(@doctor.university)
        expect(page).to have_content(@doctor.hospital.name)
      end

      within('#patients') do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
      end
    end
  end
end