require 'rails_helper'

feature 'student_profiles' do
  context 'new student signs up' do
    before do
      sign_up
    end
    scenario 'a student can click link to see their profile which takes them to their profile' do
      expect(page).to have_content('Welcome, test@test.com')
      expect(page).to have_link 'My profile'
    end

    scenario 'A new student is directed to create a profile' do
      click_link 'My profile'
      expect(page).to have_content 'You do not have a profile yet'
      expect(page).to have_link 'Create Profile'
    end
  end

  context 'Student is already signed up' do
    before do
      sign_up
      log_out_then_sign_in
    end

    scenario 'students are directed to their specific profile page' do
      click_link 'My profile'
      expect(current_path).to eq '/profiles/5'
    end

    scenario 'student views their profile' do
      expect(page).to have_content "I'm an amazing student from Spain"
      expect(page).to have_link 'Edit Profile'
    end
  end

  context 'not signed up/in' do
    scenario 'students cannot view profile when signed out' do
      visit '/'
      expect(page).not_to have_link 'My profile'
    end
  end
end
