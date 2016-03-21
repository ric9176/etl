class ProfilesController < ApplicationController
  before_action :set_user_type, only: [:show, :new, :create]

  def index
    @profiles = Profile.all
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

private

  def set_user_type
    @current_user = current_user
    @current_teacher = current_teacher
  end

  def save_profile_and_redirect
    if @profile.save
      if teacher_signed_in?
        redirect_to profile_path(:id => @current_teacher.id)
      else
        redirect_to profile_path(:id => @current_user.id)
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

  def profile_params
    params.require(:profile).permit(:name, :bio)
  end
end
