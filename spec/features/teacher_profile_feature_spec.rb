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

    scenario 'a new teacher can fill out a new profile' do
      make_teacher_profile
      expect(page).to have_content('Test teacher')
      expect(page).to have_content('I am a great teacher')
    end

    context 'teacher tries to create profile without necessary fields' do
      scenario 'teacher must fill in name, and bio when creating a profile' do
        click_link 'My profile'
        click_link 'Create Profile'
        click_button 'Create Teacher profile'
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Bio can't be blank")
      end
    end
  end
end
