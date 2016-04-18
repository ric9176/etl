require 'rails_helper'

feature 'teacher requests' do

  scenario 'a message tells student that a request is pending after choosing a teacher' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    teacher.teacher_profile = TeacherProfile.create(name: 'Test teacher', bio: 'I rock out')
    student_sign_up
    make_student_profile
    click_link 'Find a teacher'
    click_link 'Test teacher'
    expect(page).to have_content('Test teacher has not confirmed your request yet')
  end

  scenario 'teachers can see pending requests on their dashboard' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    teacher_profile = TeacherProfile.create(name: 'Teacher Johnson', bio: 'I rock out')
    teacher.teacher_profile = teacher_profile
    student = Student.create(email: 'student@test.com', password: 'test12345')
    relationship = Relationship.create
    relationship.student = student
    relationship.teacher = teacher
    student_sign_in('student@test.com', 'test12345')
    make_student_profile
    click_link 'Find a teacher'
    click_link 'Teacher Johnson'
    click_link 'Log out'
    teacher_sign_in('teacher@test.com', 'test12345')
    expect(page).to have_content('Pending requests:')
    expect(page).to have_content('Test student')
  end
end
