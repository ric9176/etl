class MaterialsController < ApplicationController
  def new
    @class = Material.new(student_id: params[:student_id])
  end

  def create
    @class = Material.create(class_params)
    if @class.save
      @class.teacher = current_teacher
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
