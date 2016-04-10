class TeacherProfilesController < ApplicationController
  def show
      @teacher = current_teacher
  end

  def new
    @teacher_profile = TeacherProfile.new
  end
end
