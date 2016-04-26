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

  scenario 'teacher can see current students on their dashboard' do
    student = Student.create(email: 'student@test.com', password: 'testtest')
    teacher = Teacher.create(email: 'teacher@test.com', password: 'testtest')
    student_profile = StudentProfile.create(name: 'Test Student', native_language: 'French', learning_objectives: 'I rock out', skype_username: 'studentskype')
    student.student_profile = student_profile
    relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id, request_status: true)
    teacher_sign_in
    expect(page).to have_content 'Current students:'
    expect(page).to have_content 'Test Student'
    expect(page).to have_content 'studentskype'
  end

  scenario 'teacher can see pending students on their dashboard' do
    student = Student.create(email: 'student@test.com', password: 'testtest')
    teacher = Teacher.create(email: 'teacher@test.com', password: 'testtest')
    student_profile = StudentProfile.create(name: 'Test Student', native_language: 'French', learning_objectives: 'I rock out', skype_username: 'studentskype')
    student.student_profile = student_profile
    relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id, request_status: false)
    teacher_sign_in
    expect(page).to have_content 'Pending requests:'
    expect(page).to have_content 'Test Student'
  end
end
