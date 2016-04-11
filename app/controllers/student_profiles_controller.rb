class StudentProfilesController < ApplicationController
  before_action :authenticate_student!


  def show
    @student = current_student
  end

  def new
    @student_profile = StudentProfile.new
  end

  def edit
    @student_profile = StudentProfile.find(params[:id])
  end

  def update
    @student_profile = StudentProfile.find(params[:id])
    if @student_profile.update(profile_params)
      redirect_to student_profile_path(id: current_student.id)
    else
      render 'edit'
    end
  end

  def create
    @student_profile = StudentProfile.create(profile_params)
    if @student_profile.save
      current_student.student_profile = @student_profile
      redirect_to student_profile_path(id: current_student.id)
    else
      render 'new'
    end
  end

private

  def profile_params
   params.require(:student_profile).permit(:name, :native_language, :learning_objectives)
  end

end
