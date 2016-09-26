require 'rails_helper'

feature 'class_materials' do
  context 'teacher makes new class materials' do
    scenario 'teacher can click_link link to add new class materials for current students' do
      teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
      teacher_profile = TeacherProfile.create(name: 'test teacher', bio: 'Im awesome')
      teacher.teacher_profile = teacher_profile
      student = Student.create(email: 'student@test.com', password: 'test12345')
      student_profile = StudentProfile.create(name: 'Test student', native_language: 'I rock out', learning_objectives: 'Learn english')
      student.student_profile = student_profile
      relationship = Relationship.create(request_status: true, student_id: student.id, teacher_id: teacher.id)
      teacher_sign_in('teacher@test.com', 'test12345')
      click_link 'Add class'
      fill_in 'Date', with: 'March 10th'
      fill_in 'Link', with: 'testlink.com'
      click_button 'Create Class material'
      click_link 'Log out'
      student_sign_in('student@test.com', 'test12345')
      expect(page).to have_content('testlink.com')
    end
  end
  scenario 'teacher can click_link to see all classes they have had with any of their students', focus: true do
    teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
    teacher_profile = TeacherProfile.create(name: 'test teacher', bio: 'Im awesome')
    teacher.teacher_profile = teacher_profile
    student = Student.create(email: 'student@test.com', password: 'test12345')
    student_profile = StudentProfile.create(name: 'Test student', native_language: 'I rock out', learning_objectives: 'Learn english')
    student.student_profile = student_profile
    relationship = Relationship.create(request_status: true, student_id: student.id, teacher_id: teacher.id)
    teacher_sign_in('teacher@test.com', 'test12345')
    click_link 'Add class'
    fill_in 'Date', with: 'March 10th'
    fill_in 'Link', with: 'testlink.com'
    click_button 'Create Class material'
    click_link 'Classes'
    expect(page).to have_content('testlink.com')
  end
end
