class DashboardController < ApplicationController

  def index
      @current_user = current_user
      @current_teacher = current_teacher
  end

end
