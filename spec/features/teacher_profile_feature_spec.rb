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

  context 'teacher is already signed up' do
    before do
      teacher_sign_up
    end

    scenario 'teachers are directed to their specific profile page' do
      teacher_log_out_then_sign_in
      click_link 'My profile'
      expect(current_path).to eq '/teacher_profiles/9'
    end

    scenario 'teacher can view their profile' do
      make_teacher_profile
      teacher_log_out_then_sign_in
      click_link 'My profile'
      expect(page).to have_content "Test teacher"
      expect(page).to have_content "I am a great teacher"
    end

    scenario 'teachers can edit their profiles' do
      make_teacher_profile
      click_link 'Edit profile'
      fill_in 'Name', with: 'Teachy teach'
      fill_in 'Bio', with: 'I love teaching'
      click_button 'Update Teacher profile'
      expect(page).to have_content('Teachy teach')
      expect(page).to have_content('I love teaching')
    end

    context 'teacher tries to edit profile without necessary fields' do
      scenario 'teacher must fill in name, and bio when editing a profile' do
        make_teacher_profile
        click_link 'Edit profile'
        fill_in 'Name', with: ''
        fill_in 'Bio', with: ''
        click_button 'Update Teacher profile'
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Bio can't be blank")
      end
    end
  end

  context 'Teacher profiles can be seen by prospective students and public' do
    scenario 'Prospective student visits site to see teachers' do
      teacher_sign_up
      make_teacher_profile
      click_link 'Log out'
      visit '/teacher_profiles'
      expect(page).to have_content("I am a great teacher")
    end
  end
end
