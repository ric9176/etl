class ClassMaterialsController < ApplicationController

  def new
    @class = ClassMaterial.new
    @student_id = params[:student_id]
    session[:student_id] = @student_id
  end

  def create
    @student_id = session[:student_id]
    @teacher = current_teacher
    @class = ClassMaterial.create(class_params.merge(student_id: @student_id, teacher_id: current_teacher.id))
    if @class.save
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end

private

  def class_params
   params.require(:class_material).permit(:date, :link)
  end
end
