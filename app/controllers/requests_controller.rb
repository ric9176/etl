class RequestsController < ApplicationController
  def update
    @teacher = Teacher.find(params[:id])
    @tutoring = Tutoring.new(teacher_id: @teacher.id, student_id: current_student.id)
    @tutoring.save
  end

  def update_number_two
    @tutoring = Tutoring.find(params[:id])
    @tutoring.request_status = true
    @tutoring.save
    redirect_to '/dashboard'
  end

  def destroy
    @tutoring = Tutoring.find(params[:id])
    @tutoring.destroy
    flash[:notice] = 'Request declined successfully'
    redirect_to '/dashboard'
  end
end
