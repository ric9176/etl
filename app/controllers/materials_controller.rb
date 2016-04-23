class MaterialsController < ApplicationController

  def new
    @class = Material.new
  end

  def create
    @teacher = current_teacher
    @class = Material.create(class_params.merge(teacher_id: current_teacher.id))
    binding.pry
    if @class.save
      @class.teacher_id = @teacher.id
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end


  def update
    @teacher = current_teacher
    @class.teacher_id = @teacher.id
  end



private

  def class_params
   params.require(:material).permit(:date, :link, :student_id)
  end
end
