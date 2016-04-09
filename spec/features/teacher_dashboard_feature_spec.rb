require 'rails_helper'

feature 'teacher_dashboards' do
  context 'new teacher signs up' do
    scenario 'teachers can log in, and a link to view their profile upon sign up' do
      teacher_sign_up
      expect(current_path).to eq '/dashboard'
      expect(page).to have_link 'My profile'
      expect(page).to have_content("teacher@test.com's dashboard")
    end
  end
end
