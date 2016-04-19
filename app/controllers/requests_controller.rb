class RequestsController < ApplicationController
  def update
    @teacher = Teacher.find(params[:id])
    @relationship = Relationship.new(teacher_id: @teacher.id, student_id: current_student.id)
    @relationship.save
  end

  def update_number_two
    @relationship = Relationship.find(parmas[:id])
    @relationship.request_status = true
    if @relationship.save
      flash[:notice] = 'Request confirmed successfully'
      redirect_to '/dashboard'
    else
      flash[:notcie] = 'Request unsuccessesful, please try again later'
      redirect_to '/dashboard'
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.destroy
      flash[:notice] = 'Request declined successfully'
      redirect_to '/dashboard'
    else
      flash[:notice] = 'Request declined successfully'
      redirect_to '/dashboard'
    end
  end


end
