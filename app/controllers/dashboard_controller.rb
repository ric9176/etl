class DashboardController < ApplicationController

  def index
    @student = current_student
    @teacher = current_teacher
    @students = Student.all
    @teachers = Teacher.all
  end
end
