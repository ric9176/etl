class StudentsController < ApplicationController
  def update
    @teacher = Teacher.find(params[:id])
    current_user.teachers << @teacher
  end

  private

  def student_params
    params.permit(:id)
  end
end
