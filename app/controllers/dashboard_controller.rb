class DashboardController < ApplicationController
  before_action :authenticate_student!, :expect => [:index]

  def index
    @student = current_student
  end
end
