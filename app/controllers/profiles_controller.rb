class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def index
    @profiles = Profile.all
  end

  def show
    @user = current_user
  end


  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    @current_user.profile = @profile
    if @profile.save
      redirect_to profile_path(:id => @current_user.id)
    else
      render 'new'
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(:id => @current_user.id)
    else
      render 'edit'
    end
  end


  def set_profile
    @current_user = current_user
    @profile = Profile.find_by(user_id: @current_user.id)
  end


  def profile_params
    params.require(:profile).permit(:name, :bio)
  end
end
