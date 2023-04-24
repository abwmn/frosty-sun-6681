class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_with_patient_counts
    doctors
    .joins(:patients)
    .select('doctors.*, COUNT(patients.id) AS patient_count')    
    .group('doctors.id')
    .order('patient_count DESC')
  end
end
