require 'rails_helper'

feature 'student_profiles' do
  context 'new student signs up' do
    scenario 'a student can click link to see their profile which takes them to their profile' do
      sign_up('test@test.com', 'testtest', 'testtest')
      expect(page).to have_content('Welcome, test@test.com')
      expect(page).to have_link 'My profile'
    end

    scenario 'A new student is directed to create a profile' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'My profile'
      expect(page).to have_content 'You do not have a profile yet'
      expect(page).to have_link 'Create Profile'
    end

    xscenario 'students are directed to their specific profile page' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Log out'
      sign_up('test2@test.com', 'testtest', 'testtest')
      click_link 'My profile'
      expect(current_path).to eq '/profiles/2'
    end
  end

  context 'current student with profile log in' do
    before do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Log out'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
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
