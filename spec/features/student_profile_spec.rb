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

    scenario 'A new student can fill out a new profile' do
      click_link 'My profile'
      click_link 'Create Profile'
      fill_in 'Name', with: 'Test'
      fill_in 'Native language', with: 'French'
      fill_in 'Learning objectives', with: 'Learn english'
      click_button 'Create Student profile'
      expect(page).to have_content('Test')
      expect(page).to have_content('French')
      expect(page).to have_content('Learn english')
    end
  end

  context 'Student is already signed up' do
    scenario 'students are directed to their specific profile page' do
      sign_up
      log_out_then_sign_in
      click_link 'My profile'
      expect(current_path).to eq '/student_profiles/6'
    end

    scenario 'student views their profile' do
      student = create(:student)
      student.student_profile = create(:student_profile)
      visit '/students/sign_in'
      fill_in 'Email', with: 'student@factory.com'
      fill_in 'Password', with: 'testing123'
      click_button 'Log in'
      click_link 'My profile'
      expect(page).to have_content "I want to speak english at restaurants"
    end
  end

  context 'not signed up/in' do
    scenario 'students cannot view profile when signed out' do
      visit '/'
      expect(page).not_to have_link 'My profile'
    end
  end
end
