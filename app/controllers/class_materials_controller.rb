class ClassMaterialsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def new
    @class = ClassMaterial.new
    session[:student_id] = params[:student_id]
  end

  def create
    @student_id = session[:student_id]
    @teacher_id = current_teacher.id
    @class = ClassMaterial.create(class_params.merge(student_id: @student_id, teacher_id: @teacher_id))
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
