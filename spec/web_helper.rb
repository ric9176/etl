def student_sign_up(email='test@test.com', password='testtest', password_confirmation='testtest')
  visit '/students/sign_up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def log_out_then_sign_in
  click_link 'Log out'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

def make_profile(name='Test student', native_language='French', learning_objectives='Learn english')
  click_link 'My profile'
  click_link 'Create Profile'
  fill_in 'Name', with: name
  fill_in 'Native language', with: native_language
  fill_in 'Learning objectives', with: learning_objectives
  click_button 'Create Student profile'
end
