require 'rails_helper'

feature 'teacher requests' do

  scenario 'a message tells student that a request is pending after choosing a teacher' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    teacher_profile = TeacherProfile.create(name: 'Test teacher', bio: 'I rock out')
    teacher.teacher_profile = teacher_profile
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
    relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id)
    student_sign_in('student@test.com', 'test12345')
    make_student_profile
    click_link 'Find a teacher'
    click_link 'Teacher Johnson'
    click_link 'Log out'
    teacher_sign_in('teacher@test.com', 'test12345')
    expect(page).to have_content('Pending requests:')
    expect(page).to have_content('Test student')
  end

  scenario 'teachers can see current students on their dashboard' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    student = Student.create(email: 'student@test.com', password: 'test12345')
    student_profile = StudentProfile.create(name: 'Test student', native_language: 'I rock out', learning_objectives: 'Learn english')
    student.student_profile = student_profile
    relationship = Relationship.create(request_status: true, student_id: student.id, teacher_id: teacher.id)
    teacher_sign_in('teacher@test.com', 'test12345')
    expect(page).to have_content('Current students:')
    expect(page).to have_content('Test student')
  end
end
