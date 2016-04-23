class MaterialsController < ApplicationController

  def new
    @class = Material.new
    @student_id = params[:student_id]
    flash[:student_id] = @student_id
  end

  def create
    binding.pry
    @teacher = current_teacher
    @class = Material.create(class_params.merge(student_id: flash[:student_id], teacher_id: current_teacher.id))
    if @class.save
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end

private

  def class_params
   params.require(:material).permit(:date, :link)
  end
end
