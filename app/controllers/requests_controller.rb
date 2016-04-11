class RequestsController < ApplicationController
  def update
    @teacher = Teacher.find(params[:id])
    current_student.teachers << @teacher
  end
end
