class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @user = current_user
  end

  def create
  end

  def new
    @profile = Profile.new
  end

  def create
    @current_user = current_user
    @profile = Profile.create(profile_params)
    @current_user.profile = @profile
    if @profile.save
      redirect_to profile_path(:id => @current_user.id)
    else
      render 'new'
    end
  end


  def profile_params
    params.require(:profile).permit(:name, :bio)
  end
end
