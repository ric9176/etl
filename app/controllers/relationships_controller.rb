class RelationshipsController < ApplicationController

  before_action :set_relationship, only: [:update, :destroy]
  before_action :set_teacher, only: :create
  before_action :authenticate_clients!

  # refactors: is a callback needed/possible for relationship params?

  def create
    if current_student.has_already_requested(@teacher)
      redirect_to '/teacher_profiles', notice: 'You have already requested this teacher'
    else
      @relationship = Relationship.create(teacher_id: @teacher.id, student_id: current_student.id)
      redirect_to '/dashboard'
    end
  end

  def update
    @student = Student.find(@relationship.student_id)
    if @student.has_a_teacher
      @relationship.destroy
      redirect_to '/dashboard', notice: 'Sorry, another teacher took on this student before you. This request has been destroyed.'
    else
      @relationship.request_status = true
      @relationship.save
      redirect_to '/dashboard', notice: 'Request confirmed successfully'
    end
  end


  def destroy
    if @relationship.destroy
      redirect_to '/dashboard', notice: 'Request successfully destroyed'
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
