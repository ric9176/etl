class DashboardController < ApplicationController
  before_action :authenticate_user!, :expect => [:index]

  def index
    @user = current_user
  end
end
