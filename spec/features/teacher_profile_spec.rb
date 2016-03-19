require 'rails_helper'

feature 'teacher_profiles' do
  context 'new teacher signs up' do
    scenario 'once teacher logs in, they should be able to view/edit their profile' do
      sign_up('test@test.com', 'testtest', 'testtest')
      expect(current_path).to eq '/dashboard'
      expect(page).to have_link 'My profile'
    end

    scenario 'teacher can click link to see their profile which takes them to their profile' do
      sign_up('test@test.com', 'testtest', 'testtest')
      expect(page).to have_content('Welcome, test@test.com')
      expect(page).to have_link 'My profile'
    end

    xscenario 'users are directed to their specific profile page' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Log out'
      sign_up('test2@test.com', 'testtest', 'testtest')
      click_link 'My profile'
      expect(current_path).to eq '/profiles/2'
    end

    scenario 'users can edit their profile' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'My profile'
      expect(page).to have_link 'Make a profile'
    end

    scenario "show a user's information if they have already created a profile" do
      @user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      @profile = Profile.create(name: 'Fred Hendrikson', bio: 'I am interested in teaching creepy things')
      @user.profile = @profile
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
      click_link 'My profile'
      expect(page).to have_content('Fred Hendrikson')
    end
  end

  context 'not signed up/in' do
    scenario 'teachers cannot view profile when signed out' do
      visit '/'
      expect(page).not_to have_link 'My profile'
    end
  end


end
