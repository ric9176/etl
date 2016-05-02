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
    expect(page).to have_content('Pending requests: Test teacher')
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

  scenario 'teachers can confirm a request' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    student = Student.create(email: 'student@test.com', password: 'test12345')
    student_profile = StudentProfile.create(name: 'Test student', native_language: 'I rock out', learning_objectives: 'Learn english')
    student.student_profile = student_profile
    relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id)
    teacher_sign_in('teacher@test.com', 'test12345')
    click_link 'Confirm'
    expect(page).to have_content('Current students:')
    expect(page).to have_content('Test student')
  end

  scenario 'teachers can decline a request' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    student = Student.create(email: 'student@test.com', password: 'test12345')
    student_profile = StudentProfile.create(name: 'Test student', native_language: 'I rock out', learning_objectives: 'Learn english')
    student.student_profile = student_profile
    relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id)
    teacher_sign_in('teacher@test.com', 'test12345')
    click_link 'Decline'
    expect(page).not_to have_content('Current students:')
    expect(page).not_to have_content('Test student')
  end

  scenario 'students should be able to undo requests' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    teacher_profile = TeacherProfile.create(name: 'Test teacher', bio: 'I rock out')
    teacher.teacher_profile = teacher_profile
    student_sign_up
    make_student_profile
    click_link 'Find a teacher'
    click_link 'Test teacher'
    click_link 'Undo request'
    expect(page).to have_no_content('Pending requests: Test teacher')
  end

  scenario 'does not allow student to send more than one request to a teacher' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    teacher_profile = TeacherProfile.create(name: 'Test teacher', bio: 'I rock out')
    teacher.teacher_profile = teacher_profile
    student_sign_up
    make_student_profile
    click_link 'Find a teacher'
    click_link 'Test teacher'
    click_link 'My profile'
    click_link 'Find a teacher'
    click_link 'Test teacher'
    expect(page).to have_content('You have already requested this teacher')
  end

  scenario 'teachers should not be able to accept students that already have teachers' do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    student = Student.create(email: 'student@test.com', password: 'test12345')
    student_profile = StudentProfile.create(name: 'Test student', native_language: 'I rock out', learning_objectives: 'Learn english')
    student.student_profile = student_profile
    false_relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id)
    true_relationship = Relationship.create(student_id: student.id, request_status: true)
    teacher_sign_in('teacher@test.com', 'test12345')
    click_link 'Confirm'
    expect(page).to have_content('Sorry, another teacher took on this student before you.')
  end
end
