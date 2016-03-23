require 'rails_helper'

feature 'user_profiles' do
  context 'new user signs up' do
    scenario 'once user logs in, they should be able to view/edit their profile' do
      sign_up_user('test@test.com', 'testtest', 'testtest')
      expect(current_path).to eq '/dashboard'
      expect(page).to have_link 'My profile'
    end

    scenario 'user can click link to see their profile which takes them to their profile' do
      sign_up_user('test@test.com', 'testtest', 'testtest')
      expect(page).to have_content('Welcome, test@test.com')
      expect(page).to have_link 'My profile'
    end

    xscenario 'users are directed to their specific profile page' do
      sign_up_user('test@test.com', 'testtest', 'testtest')
      click_link 'Log out'
      sign_up('test2@test.com', 'testtest', 'testtest')
      click_link 'My profile'
      expect(current_path).to eq '/profiles/2'
    end

    scenario 'users can edit their profile' do
      sign_up_user('test@test.com', 'testtest', 'testtest')
      click_link 'My profile'
      expect(page).to have_link 'Make a profile'
    end

    scenario 'log out link appears upon sign up/in' do
      sign_up_user('test@test.com', 'testtest', 'testtest')
      expect(page).to have_link 'Log out'
    end

    scenario "show a user's information if they have already created a profile" do
      @current_user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      @profile = Profile.create(name: 'Fred Hendrikson', bio: 'I am interested in teaching creepy things')
      @current_user.profile = @profile
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
      click_link 'My profile'
      expect(page).to have_content('Fred Hendrikson')
    end

    scenario 'user is directed to view teacher profiles after they create a profile' do
      sign_up_user('test@test.com', 'testtest', 'testtest')
      click_link 'My profile'
      click_link 'Make a profile'
      fill_in 'Name', with: 'Test Johnson'
      fill_in 'Bio', with: 'I like long rides on the subway...'
      click_button 'Create Profile'
      expect(current_path).to eq('/profiles')
    end

    context 'user has not yet created a profile' do
      scenario 'allow user to create a profile' do
        sign_up_user('test@test.com', 'testtest', 'testtest')
        click_link 'My profile'
        click_link 'Make a profile'
        fill_in 'Name', with: 'Test Johnson'
        fill_in 'Bio', with: 'I like long rides on the subway...'
        click_button 'Create Profile'
        expect(page).to have_content('Test Johnson')
      end
    end
  end

  context 'not signed up/in' do
    scenario 'users cannot view profile when signed out' do
      visit '/'
      expect(page).not_to have_link 'My profile'
    end
  end


end
