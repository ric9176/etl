class DashboardController < ApplicationController

  def index
    @student = current_student
    @teacher = current_teacher
  end
end
