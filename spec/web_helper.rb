def student_sign_up(email='student@test.com', password='testtest', password_confirmation='testtest')
  visit '/'
  click_link 'Student sign in'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def teacher_sign_up(email='teacher@test.com', password='testtest', password_confirmation='testtest')
  visit '/'
  click_link 'Teacher sign in'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def teacher_sign_in(email='teacher@test.com', password='testtest')
  visit '/'
  click_link 'Teacher sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

def student_sign_in(email='student@test.com', password='testtest')
  visit '/'
  click_link 'Student sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

def student_log_out_then_sign_in
  click_link 'Log out'
  click_link 'Student sign in'
  fill_in 'Email', with: 'student@test.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

def teacher_log_out_then_sign_in
  click_link 'Log out'
  click_link 'Teacher sign in'
  fill_in 'Email', with: 'teacher@test.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

def make_student_profile(name='Test student', native_language='French', learning_objectives='Learn english')
  click_link 'My profile'
  click_link 'Create Profile'
  fill_in 'Name', with: name
  fill_in 'Native language', with: native_language
  fill_in 'Learning objectives', with: learning_objectives
  click_button 'Create Student profile'
end

def make_teacher_profile(name='Test teacher', bio='I am a great teacher', skype='teacherskype')
  click_link 'My profile'
  click_link 'Create Profile'
  fill_in 'Name', with: name
  fill_in 'Bio', with: bio
  fill_in 'Skype username', with: 'teacherskype'
  click_button 'Create Teacher profile'
end
