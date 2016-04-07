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

  describe 'POST create' do
    xit 'creates and saves a new profile' do
      current_student = create(:student)
      expect{
        post :create, student_profile: FactoryGirl.attributes_for(:student_profile)
      }.to change(StudentProfile,:count).by(1)
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      get :show, id: ""
      expect(response).to render_template("show")
    end
  end
end


# student_profile = StudentProfile.new
# get :new
# expect(assigns(:student_profiles)).to eq([student_profile])
