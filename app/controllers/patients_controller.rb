class PatientsController < ApplicationController
  def index
    @patients = Patient.alphadults
  end
end