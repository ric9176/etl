class StudentProfilesController < ApplicationController

  def show
  end

  def new
    @student_profile = StudentProfile.new
  end

  def create
    save_profile_and_redirect
  end

  private

  def profile_params
   params.require(:student_profile).permit(:name, :native_language, :learning_objectives)
  end

  def save_profile_and_redirect
    @profile = StudentProfile.create(profile_params)
    current_student.student_profile = @profile
    if @profile.save
      redirect_to student_profile_path(id: current_student.id)
    else
      render 'new'
    end
  end
end
