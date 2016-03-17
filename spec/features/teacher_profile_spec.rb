require 'rails_helper'

feature 'teacher_profiles' do
  context 'new teacher signs up' do
    scenario 'once teacher logs in, they should be able to view/edit their profile' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
      expect(current_path).to eq '/dashboard'
      expect(page).to have_link 'My profile'
    end

    scenario 'teacher can click link to see their profile which takes them to their profile' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
      click_link 'My profile'
      expect(page).to have_content("test@test.com's profile")
      expect(page).to have_link 'Edit profile'
    end
  end

  context 'not signed up/in' do
    scenario 'teachers cannot view profile when signed out' do
      visit '/'
      expect(page).not_to have_link 'My profile'
    end
  end


end
