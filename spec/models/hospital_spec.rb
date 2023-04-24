require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it {should have_many :doctors}

  describe '#doctors_with_patient_counts' do
    it 'returns all doctors and their patient counts ordered by count' do
      hospital = Hospital.create!

      doctor1 = hospital.doctors.create!
      doctor2 = hospital.doctors.create!
      doctor3 = hospital.doctors.create!

      patient1 = doctor2.patients.create!
      patient2 = doctor2.patients.create!
      patient3 = doctor2.patients.create!

      patient4 = doctor1.patients.create!
      patient5 = doctor1.patients.create!

      patient6 = doctor3.patients.create!

      doctors = hospital.doctors_with_patient_counts

      expect(doctors).to match_array([doctor2, doctor1, doctor3])
      expect(doctors[0].patient_count).to eq(3)
      expect(doctors[0].id).to eq(doctor2.id)
      expect(doctors[1].patient_count).to eq(2)
      expect(doctors[1].id).to eq(doctor1.id)
      expect(doctors[2].patient_count).to eq(1)
      expect(doctors[2].id).to eq(doctor3.id)
    end
  end
end
