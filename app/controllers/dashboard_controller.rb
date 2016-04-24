class DashboardController < ApplicationController

before_action :authenticate_clients!

  def index
    @student = current_student
    @teacher = current_teacher
    @students = Student.all
    @teachers = Teacher.all
  end
end
