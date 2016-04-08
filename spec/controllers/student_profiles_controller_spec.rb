require 'rails_helper'

RSpec.describe StudentProfilesController, type: :controller do
  describe 'GET new' do
    xit 'assigns @student_profile' do
      student_profile = StudentProfile.new
      get :new
      expect(assigns(:student_profile)).to be_a_new(StudentProfile)
    end
      before { get :new }
      xit { should render_template('new') }
  end


  describe 'POST create' do
    # it 'creates and saves a new profile' do
    #   expect{
    #     post :create, student_profile: FactoryGirl.attributes_for(:student_profile)
    #   }.to change(StudentProfile,:count).by(1)
    # end

    # it 'creates and saves a new profile' do
    #   profile = create(:student_profile)
    #   subject.current_student.student_profile = profile
    #   post :create, profile.id
    #   expect(subject.current_student.student_profile).to eq(profile)
    # end
  end

  describe 'GET show' do
    xit 'renders the show template' do
      student_profile = create(:student_profile)
      get :show, id: student_profile
      expect(response).to render_template("show")
    end
  end
end


# student_profile = StudentProfile.new
# get :new
# expect(assigns(:student_profiles)).to eq([student_profile])
