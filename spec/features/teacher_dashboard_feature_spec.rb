require 'rails_helper'

feature 'teacher_dashboards' do
  context 'new student signs up' do
    scenario 'teachers see a welcome message and a link to view their profile upon sign up' do
      visit '/teachers/sign_up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'test12345'
      fill_in 'Password_confirmation', with: 'test12345'
      click_button 'Sign up'
      expect(current_path).to eq '/dashboard'
      expect(page).to have_link 'My profile'
      expect(page).to have_content("test@test.com's dashboard")
    end
  end
end
