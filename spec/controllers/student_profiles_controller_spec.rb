require 'rails_helper'

describe StudentProfilesController do
  describe 'GET new' do
    xit 'assigns @student_profile' do
      get '/student_profiles/new'
      binding.pry
    end
  end
  describe 'update' do
    xit 'updates student profile' do
      profile = create(:student_profile)
      put "/student_profiles/#{profile.id}", {name: 'new name', native_language: 'Spanish'}
      profile = StudentProfile.find(1)
      expect(profile.name).to eq('new name')
      expect(profile.native_language).to eq('Spanish')
    end
  end
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
