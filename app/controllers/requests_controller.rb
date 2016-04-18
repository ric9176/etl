class RequestsController < ApplicationController
  def update
    @teacher = Teacher.find(params[:id])
    @relationship = Relationship.new(teacher_id: @teacher.id, student_id: current_student.id)
    @relationship.save
  end
end
