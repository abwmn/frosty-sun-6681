require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe '.alphabetical_adults' do
    it 'returns adult patients in ascending alphabetical order' do
      patient1 = Patient.create!(name: 'Emma', age: 20)
      patient2 = Patient.create!(name: 'David', age: 16)
      patient3 = Patient.create!(name: 'Olivia', age: 30)
      patient4 = Patient.create!(name: 'Alice', age: 25)
      patient5 = Patient.create!(name: 'John', age: 12)

      result = Patient.alphadults

      expect(result).to match_array([patient1, patient3, patient4])

      expect(result[0].name).to eq('Alice')
      expect(result[1].name).to eq('Emma')
      expect(result[2].name).to eq('Olivia')
    end
  end
end
