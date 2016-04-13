class ConfirmationsController < ApplicationController
  def update
    @tutoring = Tutoring.find(params[:id])
    @tutoring.request_status = true
    @tutoring.save
    redirect_to '/dashboard'
  end

  def destroy
  end
end
