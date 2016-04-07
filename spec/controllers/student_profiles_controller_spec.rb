require 'rails_helper'

RSpec.describe StudentProfilesController, type: :controller do
  describe 'GET new' do
    xit 'assigns @student_profile' do
      student_profile = StudentProfile.new
      get :new
      expect(assigns(:student_profile)).to eq([student_profile])
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
