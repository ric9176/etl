class RelationshipsController < ApplicationController

  before_action :set_relationship, only: [:update, :destroy]
  before_action :set_teacher, only: :create

  # refactors: before action for setting teacher and relationship + strong params for relationship

  def create
    @relationship = Relationship.new(teacher_id: @teacher.id, student_id: current_student.id)
    @relationship.save
    redirect_to '/dashboard'
  end

  def update
    @relationship.request_status = true
    if @relationship.save
      redirect_to '/dashboard', notice: 'Request confirmed successfully'
    else
      redirect_to '/dashboard', notice: 'Request unsuccessesful, please try again later'
    end
  end


  def destroy
    if @relationship.destroy
      redirect_to '/dashboard', notice: 'Request declined successfully'
    else
      redirect_to '/dashboard', notice: 'Request declined successfully'
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def set_relationship
      @relationship = Relationship.find(params[:id])
  end

end
