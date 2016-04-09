require 'rails_helper'

feature 'teacher_profiles' do
  context 'new teacher signs up' do
    before do
      teacher_sign_up
    end

    scenario 'a new teacher is directed to create a profile' do
      expect(page).to have_link 'My Profile'
    end
  end
end
