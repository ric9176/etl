class ClassMaterialsController < ApplicationController

  def new
    @class = ClassMaterial.new
    @student_id = params[:student_id]
    session[:student_id] = @student_id
  end

end
