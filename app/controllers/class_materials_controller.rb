class ClassMaterialsController < ApplicationController
  def new
    @class = ClassMaterial.new(student_id: params[:student_id])
  end

  def create
    @class = ClassMaterial.create(class_params)
    if @class.save
      @class.teacher = current_teacher
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
