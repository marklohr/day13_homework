class PatientsController < ApplicationController
  def show
    @patient = Patient.find params[:id]
  end


  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create patient_params
      if @patient.save
      flash[:notice] = 'Patient data was saved successfully.'
      redirect_to patients_path
    else
      flash[:error] = 'Patient data was NOT saved successfully.'
      render :new
    end
  end

  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    if @patient.update_attributes patient_params
      flash[:notice] = 'Patient data was updated successfully.'
      redirect_to patients_path
    else
      flash[:notice] = 'Patient data was NOT updated successfully.'
      render :edit
    end

  end

  def destroy
    @patient = Patient.find params[:id]
    if @patient.delete
      flash[:notice] = 'Patient data was deleted successfully.'
      redirect_to patients_path
    else
      flash[:notice] = 'Patient data was NOT deleted successfully.'
    end
  end

private
  def patient_params
    params.require(:patient).permit(
        :first_name,
        :last_name,
        :date_of_birth,
        :description,
        :gender,
        :blood_type
      ) 
  end

end
