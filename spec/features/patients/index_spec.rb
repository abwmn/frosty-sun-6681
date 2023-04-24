require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  it 'displays names of all adult patients in alphabetical order' do
    patient1 = Patient.create!(name: 'Sue', age: 20)
    patient2 = Patient.create!(name: 'Bill', age: 17) 
    patient3 = Patient.create!(name: 'Alice', age: 25)
    patient4 = Patient.create!(name: 'Charles', age: 22)

    visit patients_path

    within('#patients') do
      expect(patient3.name).to appear_before(patient4.name)
      expect(patient4.name).to appear_before(patient1.name)
      expect(page).not_to have_content(patient2.name)
    end
  end
end
