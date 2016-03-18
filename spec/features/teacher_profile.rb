require 'rails_helper'

feature 'tacher_profiles' do
  context 'new teacher signs up' do
    scenario 'once teacher logs in, they should be able to view/edit their profile' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
      expect(page).to have_link 'My profile'
    end
  end
end