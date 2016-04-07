require 'rails_helper'

RSpec.describe StudentProfilesController, type: :controller do
  describe 'GET new' do
    it 'assigns @student_profile' do
      student_profile = StudentProfile.new
      get :new
      expect(assigns(:student_profile)).to be_a_new(StudentProfile)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end


# student_profile = StudentProfile.new
# get :new
# expect(assigns(:student_profiles)).to eq([student_profile])
