require 'rails_helper'

feature 'teacher requests' do

  scenario 'a student can request a teacher' do
    teacher = Teacher.create(email: 'test@test.com', password: 'test12345')
    teacher.teacher_profile = TeacherProfile.create(name: 'Test teacher', bio: 'I rock out')
    student_sign_up
    make_student_profile
    click_link 'Find a teacher'
    click_link 'Test teacher'
    expect(page).to have_content('Test teacher has not confirmed your request yet')
  end
end
