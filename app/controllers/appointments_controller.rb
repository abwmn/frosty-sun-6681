class AppointmentsController < ApplicationController
  def destroy
    appointment = Appointment.find(params[:id])
    doctor = appointment.doctor
    appointment.destroy
    redirect_to doctor_path(doctor), notice: 'Patient removed from doctor\'s caseload.'
  end
end