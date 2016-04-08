require 'rails_helper'

feature 'student_dashboards' do
  context 'new student signs up' do
    scenario 'once a student logs in, they should be able to view/edit their profile' do
      student_sign_up('test@test.com', 'testtest', 'testtest')
      expect(current_path).to eq '/dashboard'
      expect(page).to have_link 'My profile'
    end
    scenario 'Welcome message appears on a student dashboard' do
      student_sign_up('test@test.com', 'testtest', 'testtest')
      expect(page).to have_content("test@test.com's dashboard")
    end
  end
  context 'not signed in' do
    scenario 'cannot see dashboard if not signed in' do
      visit '/dashboard'
      expect(current_path).to eq '/students/sign_in'
    end
  end
end
