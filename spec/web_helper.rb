def sign_up(email='test@test.com', password='testtest', password_confirmation='testtest')
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
