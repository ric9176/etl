class StudentProfilesController < ApplicationController
  before_action :set_current_student, only: [:show, :new, :create, :edit, :update]
  before_action :authenticate_student!


  def show
  end

  def new
    @student_profile = StudentProfile.new
  end

  def edit
    @student_profile = StudentProfile.find(params[:id])
  end

  def update
    @profile = StudentProfile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to student_profile_path(id: current_student.id)
    else
      render 'edit'
    end
  end

  def create
    @profile = StudentProfile.create(profile_params)
    current_student.student_profile = @profile
    if @profile.save
      redirect_to student_profile_path(id: current_student.id)
    else
      render 'new'
    end
  end

private

  def profile_params
   params.require(:student_profile).permit(:name, :native_language, :learning_objectives)
  end

  def set_current_student
    @student = current_student
  end

end
