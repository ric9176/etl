class RequestsController < ApplicationController
  def update
    @teacher = Teacher.find(params[:id])
    @tutoring = Tutoring.new(teacher_id: @teacher.id, student_id: current_student.id)
    @tutoring.save
  end
end
