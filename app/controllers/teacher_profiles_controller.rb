class TeacherProfilesController < ApplicationController
  def show
      @teacher = current_teacher
  end
end
