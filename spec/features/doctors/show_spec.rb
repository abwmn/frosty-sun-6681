require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  describe 'when I visit a doctor show page' do
    before(:all) do
      @hospital = Hospital.create!(name: 'GU Hospital')
      @doctor1 = @hospital.doctors.create!(name: 'Bob', university: 'Georgetown', specialty: 'ENT')
      @doctor2 = @hospital.doctors.create!(name: 'Alice', university: 'Harvard', specialty: 'Cardiology')
      @patient1 = @doctor1.patients.create!(name: 'Sue', age: 20)
      @patient2 = @doctor1.patients.create!(name: 'Bill', age: 21)
      @patient3 = @doctor1.patients.create!(name: 'Linda', age: 25)
      @doctor2.appointments.create!(patient: @patient3)
    end

    it 'US1: I see all their info and patients' do
      visit doctor_path(@doctor1)

      within('#info') do
        expect(page).to have_content(@doctor1.name)
        expect(page).to have_content(@doctor1.specialty)
        expect(page).to have_content(@doctor1.university)
        expect(page).to have_content(@doctor1.hospital.name)
      end

      within('#patients') do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
        expect(page).to have_content(@patient3.name)
      end
    end

    it 'US2: I can remove a patient' do
      visit doctor_path(@doctor1)

      within("#patient#{@patient3.id}") do
        click_button 'Remove'
      end

      expect(current_path).to eq(doctor_path(@doctor1))

      within('#patients') do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
        expect(page).not_to have_content(@patient3.name)
      end

      visit doctor_path(@doctor2)
      within('#patients') do
        expect(page).to have_content(@patient3.name)
      end
    end
  end
end
