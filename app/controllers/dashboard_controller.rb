class DashboardController < ApplicationController

before_action :authenticate_clients!

  def index
    return student_dashboard if current_student
    return teacher_dashboard if current_teacher
    raise 401
  end

  def student_dashboard
    @student = current_student
    @students = Student.all
        @teachers = Teacher.all
    render 'dashboard/student'
  end

  def teacher_dashboard
    @teacher = current_teacher
    @teachers = Teacher.all
    @students = Student.all
    render 'dashboard/teacher'
  end
end
