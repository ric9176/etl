class RequestsController < ApplicationController

  before_action :set_teacher, only: :update
  before_action :set_relationship, only: [:confirm, :destroy]

  # refactors: before action for setting teacher and relationship + strong params for relationship

  def update
    @relationship = Relationship.new(teacher_id: @teacher.id, student_id: current_student.id)
    @relationship.save
  end

  def confirm
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
    if @relationship.destroy
      flash[:notice] = 'Request declined successfully'
      redirect_to '/dashboard'
    else
      flash[:notice] = 'Request declined successfully'
      redirect_to '/dashboard'
    end
  end

  private

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

end
