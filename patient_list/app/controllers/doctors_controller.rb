class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create doctor_params
    if @doctor.save
      flash[:notice] = 'Doctor data was saved successfully.'
      redirect_to doctors_path
    else
      flash[:error] = 'Doctor data was NOT saved successfully.'
      render :new
    end
  end
  
  private
    def doctor_params
      params.require(:doctor).permit(
        :first_name,
        :last_name,
        :biography,
        :gender_name,
        :specialty,
      ) 
  end
end
