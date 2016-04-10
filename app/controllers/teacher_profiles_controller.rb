class TeacherProfilesController < ApplicationController
  def show
      @teacher = current_teacher
  end

  def new
    @teacher_profile = TeacherProfile.new
  end

  def create
    @teacher_profile = TeacherProfile.create(profile_params)
    if @teacher_profile.save
      current_teacher.teacher_profile = @teacher_profile
      redirect_to teacher_profile_path(id: current_teacher.id)
    else
      render 'new'
    end
  end

  def edit
    @teacher_profile = TeacherProfile.find(params[:id])
  end

  def update
    @teacher_profile = TeacherProfile.find(params[:id])
    if @teacher_profile.update(profile_params)
      redirect_to teacher_profile_path(id: current_teacher.id)
    else
      render 'edit'
    end
  end

  private

  def profile_params
   params.require(:teacher_profile).permit(:name, :bio)
  end
end
