class ConfirmationsController < ApplicationController
  def update
    @tutoring = Tutoring.find(params[:id])
    @tutoring.request_status = true
    @tutoring.save
    redirect_to '/dashboard'
  end

  def destroy
    @tutoring = Tutoring.find(params[:id])
    @tutoring.destroy
    flash[:notice] = 'Request declined successfully'
    redirect_to '/dashboard'
  end
end
