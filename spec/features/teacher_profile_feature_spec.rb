require 'rails_helper'

feature 'teacher_profiles' do
  context 'new teacher signs up' do
    before do
      teacher_sign_up
    end

    scenario 'a new teacher is directed to create a profile' do
      click_link 'My profile'
      expect(page).to have_content 'You do not have a profile yet'
      expect(page).to have_link 'Create Profile'
    end
    scenario 'a new student can fill out a new profile' do
      make_teacher_profile
      expect(page).to have_content('Test teacher')
      expect(page).to have_content('I am a great teacher')
    end
  end
end
