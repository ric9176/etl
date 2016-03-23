class ProfilesController < ApplicationController
  before_action :set_user_type, only: [:show, :new, :create, :edit, :update]
  before_action :set_profile, only: [:edit, :update]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    assign_profile
    save_profile_and_redirect
  end

  def update
    if @profile.update(profile_params)
      if user_signed_in?
        redirect_to profile_path(:id => @current_user.id)
      else
        redirect_to profile_path(:id => @current_teacher.id)
      end
    else
      render 'edit'
    end
  end

private

  def set_user_type
    @current_user = current_user
    @current_teacher = current_teacher
  end

  def save_profile_and_redirect
    @profile = Profile.create(profile_params)
    @current_user.profile = @profile
    if @profile.save
      if teacher_signed_in?
        redirect_to profile_path(:id => @current_teacher.id)
      else
        redirect_to ('/profiles')
      end
    else
      render 'new'
    end
  end


  def assign_profile
    @profile = Profile.create(profile_params)
    if user_signed_in?
      @current_user.profile = @profile
    else
      @current_teacher.profile = @profile
    end
  end


  def set_profile
    if user_signed_in?
      @profile = Profile.find_by(user_id: @current_user.id)
    else
      @profile = Profile.find_by(teacher_id: @current_teacher.id)
    end
  end


  def profile_params
    params.require(:profile).permit(:name, :bio)
  end
end
